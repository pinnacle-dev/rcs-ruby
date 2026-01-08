# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/rich_message"
require_relative "types/send_rich_message_response"
require_relative "types/send_typing_indicator_schema_options"
require_relative "../../types/send_typing_indicator_response"
require_relative "../../types/rcs_validate_content"
require_relative "../../types/rcs_validation_result"
require "async"

module Pinnacle
  module Messages
    class RcsClient
      # @return [Pinnacle::RequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::Messages::RcsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Send a RCS message immediately or schedule it for future delivery. <br>
      #  Requires an active RCS agent and recipient devices that support RCS Business
      #  Messaging.
      #
      # @param request [Pinnacle::Types::RichTextMessage, Pinnacle::Types::RichMediaMessage, Pinnacle::Types::RichCardsMessage]
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::SentRichMessage, Pinnacle::Types::ScheduledMessage]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.rcs.send_(request: { quick_replies: , text: "text", from: "from", to: "to" })
      def send_(request:, request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/messages/send/rcs"
        end
        Pinnacle::Messages::Rcs::Types::SendRichMessageResponse.from_json(json_object: response.body)
      end

      # Send a typing indicator from an RCS agent to a recipient.
      #  This endpoint allows RCS agents to display a typing indicator to recipients. The
      #  indicator is a message bubble with animated typing dots like this: <img
      #  le.app/storage/v1/object/public/pinnacle-public-assets/ios-typing-indicator.png"
      #  alt="Typing Indicator" style="display: inline; height: 1.5em; vertical-align:
      #  middle; margin: 0 4px;" />
      #  **Use Case:** Typing indicators are especially useful for providing feedback to
      #  users while the agent is thinking or generating a response that may take some
      #  time, creating a more engaging conversational experience.
      #  **Expiration:** Typing indicators automatically expire after around 20 seconds
      #  or when the agent sends a message, whichever comes first.
      #  **Frequency:** You can send typing indicators as many times as needed, though
      #  only one will be displayed at a time. Sending multiple typing indicators will
      #  extend the duration of the current indicator.
      #  > **Note:** Typing indicators are best-effort hints, not delivery-guaranteed
      #  state. The platform is allowed to coalesce or drop them, and the client UI
      #  decides when to show/hide.
      #
      # @param agent_id [String] The unique identifier of the RCS agent sending the typing indicator. <br>
      #  Format: `agent_` followed by alphanumeric characters (e.g., `agent_pinnacle`).
      # @param to [String] The recipient's phone number in E.164 format. <br>
      #  Must include country code with a leading plus sign (e.g., `+14155551234`).
      # @param options [Hash] Configure how your typing indicator is sent.Request of type Pinnacle::Messages::Rcs::Types::SendTypingIndicatorSchemaOptions, as a Hash
      #   * :test_mode (Boolean)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::SendTypingIndicatorResponse]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.rcs.send_typing(
      #    agent_id: "agent_pinnacle",
      #    to: "+14154746461",
      #    options: { test_mode: false }
      #  )
      def send_typing(agent_id:, to:, options: nil, request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            agentId: agent_id,
            to: to,
            options: options
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/messages/send/typing"
        end
        Pinnacle::Types::SendTypingIndicatorResponse.from_json(json_object: response.body)
      end

      # Validate RCS message content without sending it.
      #
      # @param request [Pinnacle::Types::RichText, Pinnacle::Types::RcsValidateContentMedia, Pinnacle::Types::RichCards]
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::RcsValidationResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.rcs.validate(request: { quick_replies: , text: "text" })
      def validate(request:, request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/messages/validate/rcs"
        end
        Pinnacle::Types::RcsValidationResult.from_json(json_object: response.body)
      end
    end

    class AsyncRcsClient
      # @return [Pinnacle::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::Messages::AsyncRcsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Send a RCS message immediately or schedule it for future delivery. <br>
      #  Requires an active RCS agent and recipient devices that support RCS Business
      #  Messaging.
      #
      # @param request [Pinnacle::Types::RichTextMessage, Pinnacle::Types::RichMediaMessage, Pinnacle::Types::RichCardsMessage]
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::SentRichMessage, Pinnacle::Types::ScheduledMessage]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.rcs.send_(request: { quick_replies: , text: "text", from: "from", to: "to" })
      def send_(request:, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/messages/send/rcs"
          end
          Pinnacle::Messages::Rcs::Types::SendRichMessageResponse.from_json(json_object: response.body)
        end
      end

      # Send a typing indicator from an RCS agent to a recipient.
      #  This endpoint allows RCS agents to display a typing indicator to recipients. The
      #  indicator is a message bubble with animated typing dots like this: <img
      #  le.app/storage/v1/object/public/pinnacle-public-assets/ios-typing-indicator.png"
      #  alt="Typing Indicator" style="display: inline; height: 1.5em; vertical-align:
      #  middle; margin: 0 4px;" />
      #  **Use Case:** Typing indicators are especially useful for providing feedback to
      #  users while the agent is thinking or generating a response that may take some
      #  time, creating a more engaging conversational experience.
      #  **Expiration:** Typing indicators automatically expire after around 20 seconds
      #  or when the agent sends a message, whichever comes first.
      #  **Frequency:** You can send typing indicators as many times as needed, though
      #  only one will be displayed at a time. Sending multiple typing indicators will
      #  extend the duration of the current indicator.
      #  > **Note:** Typing indicators are best-effort hints, not delivery-guaranteed
      #  state. The platform is allowed to coalesce or drop them, and the client UI
      #  decides when to show/hide.
      #
      # @param agent_id [String] The unique identifier of the RCS agent sending the typing indicator. <br>
      #  Format: `agent_` followed by alphanumeric characters (e.g., `agent_pinnacle`).
      # @param to [String] The recipient's phone number in E.164 format. <br>
      #  Must include country code with a leading plus sign (e.g., `+14155551234`).
      # @param options [Hash] Configure how your typing indicator is sent.Request of type Pinnacle::Messages::Rcs::Types::SendTypingIndicatorSchemaOptions, as a Hash
      #   * :test_mode (Boolean)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::SendTypingIndicatorResponse]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.rcs.send_typing(
      #    agent_id: "agent_pinnacle",
      #    to: "+14154746461",
      #    options: { test_mode: false }
      #  )
      def send_typing(agent_id:, to:, options: nil, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              agentId: agent_id,
              to: to,
              options: options
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/messages/send/typing"
          end
          Pinnacle::Types::SendTypingIndicatorResponse.from_json(json_object: response.body)
        end
      end

      # Validate RCS message content without sending it.
      #
      # @param request [Pinnacle::Types::RichText, Pinnacle::Types::RcsValidateContentMedia, Pinnacle::Types::RichCards]
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::RcsValidationResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.rcs.validate(request: { quick_replies: , text: "text" })
      def validate(request:, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/messages/validate/rcs"
          end
          Pinnacle::Types::RcsValidationResult.from_json(json_object: response.body)
        end
      end
    end
  end
end
