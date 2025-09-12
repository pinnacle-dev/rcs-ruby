# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/webhook_result"
require "async"

module Pinnacle
  class WebhooksClient
    # @return [Pinnacle::RequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::RequestClient]
    # @return [Pinnacle::WebhooksClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieve all webhook that are set up to receive events for specific URLs or
    #  phone numbers.
    #
    # @param identifiers [Array<String>] List of URLs or phone numbers in E.164 format that the webhook is attached to.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::WebhookResult]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.webhooks.get(identifiers: ["https://www.pinnacle.sh/payment", "+14155678901", "https://www.pinnacle.sh/sms-callback", "+14153456659"])
    def get(identifiers:, request_options: nil)
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
        req.body = { **(request_options&.additional_body_parameters || {}), identifiers: identifiers }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/webhooks"
      end
      Pinnacle::Types::WebhookResult.from_json(json_object: response.body)
    end
  end

  class AsyncWebhooksClient
    # @return [Pinnacle::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::AsyncRequestClient]
    # @return [Pinnacle::AsyncWebhooksClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Retrieve all webhook that are set up to receive events for specific URLs or
    #  phone numbers.
    #
    # @param identifiers [Array<String>] List of URLs or phone numbers in E.164 format that the webhook is attached to.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::WebhookResult]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.webhooks.get(identifiers: ["https://www.pinnacle.sh/payment", "+14155678901", "https://www.pinnacle.sh/sms-callback", "+14153456659"])
    def get(identifiers:, request_options: nil)
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
          req.body = { **(request_options&.additional_body_parameters || {}), identifiers: identifiers }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/webhooks"
        end
        Pinnacle::Types::WebhookResult.from_json(json_object: response.body)
      end
    end
  end
end
