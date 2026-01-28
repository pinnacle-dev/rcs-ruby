# frozen_string_literal: true

module Rcs
  module Messages
    module Rcs
      class Client
        # @param client [Rcs::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Send a RCS message immediately or schedule it for future delivery. <br>
        #
        # Requires an active RCS agent and recipient devices that support RCS Business Messaging.
        #
        # @param request_options [Hash]
        # @param params [Rcs::Types::RichMessage]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Rcs::Messages::Rcs::Types::SendRichMessageResponse]
        def send_(request_options: {}, **params)
          params = Rcs::Internal::Types::Utils.normalize_keys(params)
          request = Rcs::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "messages/send/rcs",
            body: Rcs::Types::RichMessage.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rcs::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rcs::Messages::Rcs::Types::SendRichMessageResponse.load(response.body)
          else
            error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Send a typing indicator from an RCS agent to a recipient.
        #
        # This endpoint allows RCS agents to display a typing indicator to recipients. The indicator is a message bubble
        # with animated typing dots like this: <img
        # src="https://server.trypinnacle.app/storage/v1/object/public/pinnacle-public-assets/ios-typing-indicator.png"
        # alt="Typing Indicator" style="display: inline; height: 1.5em; vertical-align: middle; margin: 0 4px;" />
        #
        # **Use Case:** Typing indicators are especially useful for providing feedback to users while the agent is
        # thinking or generating a response that may take some time, creating a more engaging conversational experience.
        #
        # **Expiration:** Typing indicators automatically expire after around 20 seconds or when the agent sends a
        # message, whichever comes first.
        #
        # **Frequency:** You can send typing indicators as many times as needed, though only one will be displayed at a
        # time. Sending multiple typing indicators will extend the duration of the current indicator.
        #
        # > **Note:** Typing indicators are best-effort hints, not delivery-guaranteed state. The platform is allowed to
        # coalesce or drop them, and the client UI decides when to show/hide.
        #
        # @param request_options [Hash]
        # @param params [Rcs::Messages::Rcs::Types::SendTypingIndicatorSchema]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Rcs::Types::SendTypingIndicatorResponse]
        def send_typing(request_options: {}, **params)
          params = Rcs::Internal::Types::Utils.normalize_keys(params)
          body_prop_names = %i[agent_id to options]
          body_bag = params.slice(*body_prop_names)

          request = Rcs::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "messages/send/typing",
            body: Rcs::Messages::Rcs::Types::SendTypingIndicatorSchema.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rcs::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rcs::Types::SendTypingIndicatorResponse.load(response.body)
          else
            error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Validate RCS message content without sending it.
        #
        # @param request_options [Hash]
        # @param params [Rcs::Types::RcsValidateContent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Rcs::Types::RcsValidationResult]
        def validate(request_options: {}, **params)
          params = Rcs::Internal::Types::Utils.normalize_keys(params)
          request = Rcs::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "messages/validate/rcs",
            body: Rcs::Types::RcsValidateContent.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rcs::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rcs::Types::RcsValidationResult.load(response.body)
          else
            error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
