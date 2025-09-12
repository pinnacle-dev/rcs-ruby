# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/sms_content"
require_relative "../../types/sms_validation_result"
require "async"

module Pinnacle
  module Message
    class SmsClient
      # @return [Pinnacle::RequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::Message::SmsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Validate SMS message content without sending it.
      #
      # @param request [Hash] Request of type Pinnacle::SmsContent, as a Hash
      #   * :text (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::SmsValidationResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.message.sms.validate(request: { text: "Hello from Pinnacle" })
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
        Pinnacle::SmsValidationResult.from_json(json_object: response.body)
      end
    end

    class AsyncSmsClient
      # @return [Pinnacle::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::Message::AsyncSmsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Validate SMS message content without sending it.
      #
      # @param request [Hash] Request of type Pinnacle::SmsContent, as a Hash
      #   * :text (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::SmsValidationResult]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.message.sms.validate(request: { text: "Hello from Pinnacle" })
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
          Pinnacle::SmsValidationResult.from_json(json_object: response.body)
        end
      end
    end
  end
end
