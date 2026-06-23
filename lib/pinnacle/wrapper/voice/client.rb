# frozen_string_literal: true

require_relative "../../calls/client"
require_relative "voice_socket"

module Pinnacle
  module Wrapper
    module Voice
      class Client
        def initialize(client:)
          @calls = Pinnacle::Calls::Client.new(client: client)
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
            reconnect: reconnect
          )
        end

        def connect_stream(stream_url, protocols: nil, reconnect: nil, socket: nil)
          socket_class = socket || default_socket
          create_socket = -> { new_socket(socket_class, stream_url, protocols) }
          VoiceSocket.new(create_socket.call, create_socket: create_socket, reconnect: reconnect)
        end

        private

        def default_socket
          raise "No default WebSocket implementation is bundled. Pass socket: to client.voice.connect or " \
                "client.voice.connect_stream."
        end

        def new_socket(socket_class, stream_url, protocols)
          return socket_class.new(stream_url) if protocols.nil?

          socket_class.new(stream_url, protocols)
        end
      end
    end
  end
end
