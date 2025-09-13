# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/rcs"
require_relative "types/rcs_send_response"
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
      # @return [Pinnacle::Types::SentRcsDetails, Pinnacle::Types::ScheduledMessaage]
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
        Pinnacle::Messages::Rcs::Types::RcsSendResponse.from_json(json_object: response.body)
      end

      # Validate RCS message content without sending it.
      #
      # @param request [Pinnacle::Types::RcsTextContent, Pinnacle::Types::RcsValidateContentMedia, Pinnacle::Types::RcsCards]
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
      # @return [Pinnacle::Types::SentRcsDetails, Pinnacle::Types::ScheduledMessaage]
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
          Pinnacle::Messages::Rcs::Types::RcsSendResponse.from_json(json_object: response.body)
        end
      end

      # Validate RCS message content without sending it.
      #
      # @param request [Pinnacle::Types::RcsTextContent, Pinnacle::Types::RcsValidateContentMedia, Pinnacle::Types::RcsCards]
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
