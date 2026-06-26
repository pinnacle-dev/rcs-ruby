# frozen_string_literal: true

require_relative "../../calls/client"
require_relative "voice_socket"

module Pinnacle
  module Wrapper
    module Voice
      class Client
        DEFAULT_RECONNECT = { enabled: true }.freeze

        class DefaultSocket
          attr_reader :ready_state

          def initialize(url, protocols = nil)
            @ready_state = 0
            @listeners = Hash.new { |hash, key| hash[key] = [] }
            headers = if protocols.nil?
                        {}
                      else
                        { "Sec-WebSocket-Protocol" => Array(protocols).join(", ") }
                      end
            @socket = WebSocket::Client::Simple.connect(url, headers: headers)
            wrapper = self
            @socket.on(:open) do |event|
              wrapper.__send__(:dispatch_open, event)
            end
            @socket.on(:message) { |message| wrapper.__send__(:emit, "message", { data: message.data }) }
            @socket.on(:error) { |error| wrapper.__send__(:emit, "error", error) }
            @socket.on(:close) do |event|
              wrapper.__send__(:dispatch_close, event)
            end
          end

          def add_event_listener(event, &listener)
            @listeners[event.to_s] << listener
          end

          def send(data)
            @socket.send(data)
          end

          def close(*)
            @socket.close
          end

          private

          def dispatch_open(event)
            @ready_state = 1
            emit("open", event)
          end

          def dispatch_close(event)
            @ready_state = 3
            emit("close", event)
          end

          def emit(event, payload)
            @listeners[event].each { |listener| listener.call(payload) }
          end
        end

        def initialize(client:)
          @calls = Pinnacle::Calls::Client.new(client: client)
        end

        def create_and_connect(
          to:,
          from:,
          record: nil,
          metadata: nil,
          token: nil,
          protocols: nil,
          reconnect: nil,
          socket: nil,
          request_options: {}
        )
          call_params = { to: to, from: from }
          call_params[:record] = record unless record.nil?
          call_params[:metadata] = metadata unless metadata.nil?
          call = @calls.create(**call_params, request_options: request_options)
          connection = connect(
            call_id: call.id,
            token: token,
            protocols: protocols,
            reconnect: DEFAULT_RECONNECT.merge(reconnect || {}),
            socket: socket
          )
          connection.call = call
          connection.call_id = call.id
          connection
        end

        def connect(call_id:, token: nil, protocols: nil, reconnect: nil, socket: nil)
          socket_class = socket || default_socket
          token_params = token || {}
          stream_token = @calls.create_stream_token(**token_params, id: call_id)
          create_socket = -> do
            next_token = @calls.create_stream_token(**token_params, id: call_id)
            new_socket(socket_class, next_token.stream_url, protocols)
          end

          VoiceSocket.new(
            new_socket(socket_class, stream_token.stream_url, protocols),
            create_socket: create_socket,
            reconnect: DEFAULT_RECONNECT.merge(reconnect || {})
          )
        end

        def connect_stream(stream_url, protocols: nil, reconnect: nil, socket: nil)
          socket_class = socket || default_socket
          create_socket = -> { new_socket(socket_class, stream_url, protocols) }
          VoiceSocket.new(create_socket.call, create_socket: create_socket, reconnect: reconnect)
        end

        private

        def default_socket
          require "websocket-client-simple" unless defined?(::WebSocket::Client::Simple)
          DefaultSocket
        rescue LoadError => e
          raise e, "The rcs gem could not load its websocket-client-simple dependency. Reinstall rcs or pass socket: to client.voice.connect."
        end

        def new_socket(socket_class, stream_url, protocols)
          return socket_class.new(stream_url) if protocols.nil?

          socket_class.new(stream_url, protocols)
        end
      end
    end
  end
end
