# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/send_sms_options"
require_relative "types/sms_send_response"
require_relative "../../types/sms_content"
require_relative "../../types/sms_validation_result"
require "async"

module Pinnacle
  module Messages
    class SmsClient
      # @return [Pinnacle::RequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::Messages::SmsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Send a SMS message immediately or schedule it for future delivery.
      #
      # @param from [String] Phone number that sends the message in E.164 format.
      # @param options [Hash] Additional settings to customize SMS delivery.Request of type Pinnacle::Messages::Sms::Types::SendSmsOptions, as a Hash
      #   * :schedule (Hash)
      #     * :send_at (String)
      #     * :recurrence (String)
      #     * :timezone (String)
      #     * :end_date (String)
      #   * :tracking (Pinnacle::Types::Tracking)
      # @param text [String] Message content.
      # @param to [String] Recipient's phone number in E.164 format.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::SentSmsDetails, Pinnacle::Types::ScheduledMessage]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.sms.send_(
      #    from: "+14155164736",
      #    text: "Hey!",
      #    to: "+14154746461"
      #  )
      def send_(from:, text:, to:, options: nil, request_options: nil)
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
            from: from,
            options: options,
            text: text,
            to: to
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/messages/send/sms"
        end
        Pinnacle::Messages::Sms::Types::SmsSendResponse.from_json(json_object: response.body)
      end

      # Validate SMS message content without sending it.
      #
      # @param request [Hash] Request of type Pinnacle::Types::SmsContent, as a Hash
      #   * :text (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::SmsValidationResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.sms.validate(request: { text: "Hello from Pinnacle" })
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
          req.url "#{@request_client.get_url(request_options: request_options)}/messages/validate/sms"
        end
        Pinnacle::Types::SmsValidationResult.from_json(json_object: response.body)
      end
    end

    class AsyncSmsClient
      # @return [Pinnacle::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::Messages::AsyncSmsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Send a SMS message immediately or schedule it for future delivery.
      #
      # @param from [String] Phone number that sends the message in E.164 format.
      # @param options [Hash] Additional settings to customize SMS delivery.Request of type Pinnacle::Messages::Sms::Types::SendSmsOptions, as a Hash
      #   * :schedule (Hash)
      #     * :send_at (String)
      #     * :recurrence (String)
      #     * :timezone (String)
      #     * :end_date (String)
      #   * :tracking (Pinnacle::Types::Tracking)
      # @param text [String] Message content.
      # @param to [String] Recipient's phone number in E.164 format.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::SentSmsDetails, Pinnacle::Types::ScheduledMessage]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.sms.send_(
      #    from: "+14155164736",
      #    text: "Hey!",
      #    to: "+14154746461"
      #  )
      def send_(from:, text:, to:, options: nil, request_options: nil)
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
              from: from,
              options: options,
              text: text,
              to: to
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/messages/send/sms"
          end
          Pinnacle::Messages::Sms::Types::SmsSendResponse.from_json(json_object: response.body)
        end
      end

      # Validate SMS message content without sending it.
      #
      # @param request [Hash] Request of type Pinnacle::Types::SmsContent, as a Hash
      #   * :text (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::SmsValidationResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.messages.sms.validate(request: { text: "Hello from Pinnacle" })
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
            req.url "#{@request_client.get_url(request_options: request_options)}/messages/validate/sms"
          end
          Pinnacle::Types::SmsValidationResult.from_json(json_object: response.body)
        end
      end
    end
  end
end
