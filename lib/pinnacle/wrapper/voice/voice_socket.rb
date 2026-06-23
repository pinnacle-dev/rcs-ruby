# frozen_string_literal: true

require "json"
require "securerandom"
require "timeout"

require_relative "types"

module Pinnacle
  module Wrapper
    module Voice
      class VoiceSocket
        attr_reader :socket

        def initialize(socket, create_socket: nil, reconnect: nil)
          @socket = socket
          @create_socket = create_socket
          @reconnect = normalize_reconnect_options(reconnect || {})
          @listeners = Hash.new { |hash, key| hash[key] = [] }
          @pending_acks = {}
          @closed_by_user = false
          @reconnect_attempts = 0
          @reconnect_thread = nil
          bind_socket
        end

        def ready_state
          if @socket.respond_to?(:ready_state)
            @socket.ready_state
          elsif @socket.respond_to?(:readyState)
            @socket.readyState
          else
            0
          end
        end

        def open?
          ready_state == 1
        end

        def wait_until_open(timeout_ms: 10_000)
          return if open?

          mutex = Mutex.new
          condition = ConditionVariable.new
          error = nil
          done = false
          unsubscribers = []

          cleanup = -> do
            unsubscribers.each(&:call)
          end
          finish = ->(next_error) do
            mutex.synchronize do
              error = next_error
              done = true
              condition.signal
            end
          end

          unsubscribers << on("open") do
            cleanup.call
            finish.call(nil)
          end
          unsubscribers << on("close") do
            cleanup.call
            finish.call(RuntimeError.new("Voice socket closed before opening."))
          end
          unsubscribers << on("error") do |event|
            cleanup.call
            finish.call(to_error(event))
          end

          mutex.synchronize do
            condition.wait(mutex, timeout_ms / 1000.0) unless done
          end
          cleanup.call unless done
          raise Timeout::Error, "Timed out waiting for voice socket to open." unless done
          raise error unless error.nil?
        end

        def connect
          wait_until_open
        end

        def on(event, &listener)
          @listeners[event] << listener
          -> { @listeners[event].delete(listener) }
        end

        def send(frame)
          @socket.send(JSON.generate(frame))
        end

        def command(frame)
          send(frame)
          frame.fetch(:command_id)
        end

        def command_and_wait(frame, timeout_ms: 10_000)
          waiter = wait_for_ack(frame.fetch(:command_id), timeout_ms: timeout_ms)
          command(frame)
          waiter.call
        end

        def answer(params = nil, command_id: create_voice_command_id)
          command(with_optional_params(command_frame(command_id, Types::CALL_ANSWER), params))
        end

        def end_call(params = nil, command_id: create_voice_command_id)
          command(with_optional_params(command_frame(command_id, Types::CALL_END), params))
        end

        def transfer(params, command_id: create_voice_command_id)
          command(command_frame(command_id, Types::CALL_TRANSFER, params))
        end

        def start_recording(command_id: create_voice_command_id)
          command(command_frame(command_id, Types::RECORDING_START))
        end

        def stop_recording(command_id: create_voice_command_id)
          command(command_frame(command_id, Types::RECORDING_STOP))
        end

        def play_audio(params, command_id: create_voice_command_id)
          command(command_frame(command_id, Types::AUDIO_PLAY, params))
        end

        def stop_audio(command_id: create_voice_command_id)
          command(command_frame(command_id, Types::AUDIO_STOP))
        end

        def reduce_noise(params, command_id: create_voice_command_id)
          command(command_frame(command_id, Types::AUDIO_REDUCE_NOISE, params))
        end

        def get_input(params = nil, command_id: create_voice_command_id)
          command(with_optional_params(command_frame(command_id, Types::INPUT_GET), params))
        end

        def cancel_input(command_id: create_voice_command_id)
          command(command_frame(command_id, Types::INPUT_CANCEL))
        end

        def send_dtmf(params, command_id: create_voice_command_id)
          command(command_frame(command_id, Types::DTMF_SEND, params))
        end

        def update_state(params, command_id: create_voice_command_id)
          command(command_frame(command_id, Types::CALL_UPDATE_STATE, params))
        end

        def send_media(media)
          send({ event: "media", media: media })
        end

        def wait_for_ack(command_id, timeout_ms: 10_000)
          raise "Already waiting for ack #{command_id}." if @pending_acks.key?(command_id)

          mutex = Mutex.new
          condition = ConditionVariable.new
          result = nil
          error = nil
          done = false
          @pending_acks[command_id] = ->(ack, next_error) do
            mutex.synchronize do
              result = ack
              error = next_error
              done = true
              condition.signal
            end
          end

          -> do
            mutex.synchronize do
              condition.wait(mutex, timeout_ms / 1000.0) unless done
            end
            @pending_acks.delete(command_id)
            raise Timeout::Error, "Timed out waiting for ack #{command_id}." unless done
            raise error unless error.nil?

            result
          end
        end

        def close(code = nil, reason = nil)
          @closed_by_user = true
          @reconnect_thread&.kill
          close_socket(@socket, code, reason)
        end

        def reconnect_now
          raise "Voice socket was not configured with a reconnect factory." if @create_socket.nil?

          @closed_by_user = false
          @socket = @create_socket.call
          bind_socket
          @reconnect_attempts = 0
          emit("reconnected", @socket)
          self
        end

        def handle_message(data)
          frame = parse_voice_frame(data)
          emit("frame", frame)
          case frame["event"]
          when "ack"
            resolve_pending_ack(frame)
            emit("ack", frame)
          when "event"
            emit("event", frame)
          when "media"
            emit("media", frame)
          else
            raise "Voice socket received an unknown frame event."
          end
        rescue StandardError => e
          emit("error", e)
        end

        private

        def bind_socket
          bind_socket_event(@socket, "open") { |event| emit("open", event) }
          bind_socket_event(@socket, "close") { |event| handle_close(event) }
          bind_socket_event(@socket, "error") { |event| emit("error", event) }
          bind_socket_event(@socket, "message") { |event| handle_message(message_data(event)) }
        end

        def handle_close(event)
          reject_pending_acks(RuntimeError.new("Voice socket closed before an ack was received."))
          emit("close", event)
          schedule_reconnect
        end

        def resolve_pending_ack(ack)
          resolver = @pending_acks.delete(ack["command_id"])
          resolver&.call(ack, nil)
        end

        def reject_pending_acks(error)
          @pending_acks.each_value { |resolver| resolver.call(nil, error) }
          @pending_acks.clear
        end

        def emit(event, payload)
          @listeners[event].each { |listener| listener.call(payload) }
        end

        def schedule_reconnect
          return if @closed_by_user || !@reconnect[:enabled] || @create_socket.nil? || @reconnect_thread&.alive?

          if @reconnect_attempts >= @reconnect[:max_attempts]
            emit("error", RuntimeError.new("Voice socket reconnect attempts exhausted."))
            return
          end

          @reconnect_attempts += 1
          delay_ms = reconnect_delay(@reconnect, @reconnect_attempts)
          emit("reconnecting", { attempt: @reconnect_attempts, delay_ms: delay_ms })
          @reconnect_thread = Thread.new do
            sleep(delay_ms / 1000.0)
            reconnect_now
          rescue StandardError => e
            emit("error", e)
            schedule_reconnect
          end
        end

        def command_frame(command_id, action, params = nil)
          frame = { event: "command", command_id: command_id, action: action }
          frame[:params] = params unless params.nil?
          frame
        end

        def with_optional_params(frame, params)
          frame[:params] = params unless params.nil?
          frame
        end

        def parse_voice_frame(data)
          raise "Voice socket received a non-string frame." unless data.is_a?(String)

          JSON.parse(data)
        end

        def bind_socket_event(socket, event, &listener)
          if socket.respond_to?(:add_event_listener)
            socket.add_event_listener(event, &listener)
          elsif socket.respond_to?(:addEventListener)
            socket.addEventListener(event, listener)
          elsif socket.respond_to?(:on)
            socket.on(event, &listener)
          else
            socket.public_send(:"on#{event}=", listener)
          end
        end

        def message_data(event)
          event.is_a?(Hash) ? event[:data] || event["data"] : event.data
        end

        def close_socket(socket, code, reason)
          if code.nil? && reason.nil?
            socket.close
          elsif reason.nil?
            socket.close(code)
          else
            socket.close(code, reason)
          end
        end

        def normalize_reconnect_options(options)
          {
            enabled: options.fetch(:enabled, options.fetch("enabled", false)),
            max_attempts: options.fetch(:max_attempts, options.fetch(:maxAttempts, options.fetch("maxAttempts", 5))),
            initial_delay_ms: options.fetch(
              :initial_delay_ms,
              options.fetch(:initialDelayMs, options.fetch("initialDelayMs", 250))
            ),
            max_delay_ms: options.fetch(:max_delay_ms, options.fetch(:maxDelayMs, options.fetch("maxDelayMs", 5_000))),
            backoff_multiplier: options.fetch(
              :backoff_multiplier,
              options.fetch(:backoffMultiplier, options.fetch("backoffMultiplier", 2))
            )
          }
        end

        def reconnect_delay(options, attempt)
          delay = options[:initial_delay_ms] * (options[:backoff_multiplier]**[attempt - 1, 0].max)
          [delay, options[:max_delay_ms]].min
        end

        def create_voice_command_id
          self.class.create_voice_command_id
        end

        def to_error(error)
          error.is_a?(Exception) ? error : RuntimeError.new("Voice socket error.")
        end

        class << self
          def create_voice_command_id
            "cmd_#{SecureRandom.uuid}"
          end
        end
      end
    end
  end
end
