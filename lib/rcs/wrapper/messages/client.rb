# frozen_string_literal: true

require "json"

module Rcs
  module Wrapper
    module Messages
      class Client < Rcs::Messages::Client
        # Process incoming webhook request with signature validation.
        #
        # @example Process a webhook request
        #   client = Rcs::Client.new(api_key: "your-api-key")
        #   request = {
        #     headers: { "PINNACLE-SIGNING-SECRET" => "your-secret" },
        #     body: '{"type": "MESSAGE.RECEIVED", ...}'
        #   }
        #   event = client.messages.process(request)
        #
        # @param request [Hash] Request with :headers and :body keys
        # @param secret [String, nil] Webhook secret (falls back to PINNACLE_SIGNING_SECRET env var)
        #
        # @return [Rcs::Types::MessageEvent, Rcs::Types::UserEvent]
        # @raise [Rcs::Errors::UnauthorizedError] If webhook signature is invalid or missing
        # @raise [Rcs::Errors::ClientError] If request body cannot be parsed
        def process(request, secret: nil)
          headers = request[:headers] || request["headers"] || {}
          body = request[:body] || request["body"]

          header_secret = headers["PINNACLE-SIGNING-SECRET"] ||
                          headers["pinnacle-signing-secret"] ||
                          headers["Pinnacle-Signing-Secret"]

          env_secret = secret || ENV.fetch("PINNACLE_SIGNING_SECRET", nil)

          if header_secret.nil?
            raise Rcs::Errors::UnauthorizedError.new(
              "Failed to get PINNACLE-SIGNING-SECRET header from request",
              code: 401
            )
          end

          if env_secret.nil?
            raise Rcs::Errors::UnauthorizedError.new(
              "Set PINNACLE_SIGNING_SECRET env var or pass secret argument",
              code: 401
            )
          end

          if header_secret != env_secret
            raise Rcs::Errors::UnauthorizedError.new(
              "Invalid webhook signature",
              code: 401
            )
          end

          parsed = body.is_a?(String) ? JSON.parse(body) : body

          if parsed["type"] == "USER.TYPING"
            Rcs::Types::UserEvent.coerce(parsed)
          else
            Rcs::Types::MessageEvent.coerce(parsed)
          end
        rescue JSON::ParserError => e
          raise Rcs::Errors::ClientError.new(
            "Invalid message event format: #{e.message}",
            code: 400
          )
        end
      end
    end
  end
end
