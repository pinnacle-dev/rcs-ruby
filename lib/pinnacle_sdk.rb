# frozen_string_literal: true

require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "pinnacle_sdk/types/check_rcs_capability_response"
require_relative "pinnacle_sdk/types/receive_rcs_messages_response"
require_relative "pinnacle_sdk/types/send_an_rcs_message_request_body"
require_relative "pinnacle_sdk/types/send_an_rcs_message_response"

module Pinnacle
  class Client
    # @param base_url [String]
    # @param environment [Pinnacle::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param pinnacle_api_key [String] Pinnacle API Key for authentication
    # @return [Pinnacle::Client]
    def initialize(pinnacle_api_key:, base_url: nil, environment: Pinnacle::Environment::DEFAULT, max_retries: nil,
                   timeout_in_seconds: nil)
      @request_client = Pinnacle::RequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        pinnacle_api_key: pinnacle_api_key
      )
    end

    # Checks if a phone number is able to receive RCS
    #
    # @param phone_number [String] The phone number to check for RCS capability
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::CheckRcsCapabilityResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    pinnacle_api_key: "PinnacleApiKey"
    #  )
    #  api.check_rcs_capability(phone_number: "phone_number")
    def check_rcs_capability(phone_number:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-KEY"] = request_options.pinnacle_api_key unless request_options&.pinnacle_api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "phone_number": phone_number }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/check_rcs"
      end
      Pinnacle::CheckRcsCapabilityResponse.from_json(json_object: response.body)
    end

    # @param webhook_url [String] Webhook URL to receive RCS messages
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::ReceiveRcsMessagesResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    pinnacle_api_key: "PinnacleApiKey"
    #  )
    #  api.receive_rcs_messages
    def receive_rcs_messages(webhook_url: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-KEY"] = request_options.pinnacle_api_key unless request_options&.pinnacle_api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), webhook_url: webhook_url }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/init"
      end
      Pinnacle::ReceiveRcsMessagesResponse.from_json(json_object: response.body)
    end

    # @param request [Pinnacle::RcsMessage, Pinnacle::SmsMessage]
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::RcsMessageSent, Pinnacle::SmsMessageSent]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    pinnacle_api_key: "PinnacleApiKey"
    #  )
    #  api.send_an_rcs_message(request: {  })
    def send_an_rcs_message(request:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-KEY"] = request_options.pinnacle_api_key unless request_options&.pinnacle_api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/send"
      end
      Pinnacle::SendAnRcsMessageResponse.from_json(json_object: response.body)
    end
  end

  class AsyncClient
    # @param base_url [String]
    # @param environment [Pinnacle::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param pinnacle_api_key [String] Pinnacle API Key for authentication
    # @return [Pinnacle::AsyncClient]
    def initialize(pinnacle_api_key:, base_url: nil, environment: Pinnacle::Environment::DEFAULT, max_retries: nil,
                   timeout_in_seconds: nil)
      @async_request_client = Pinnacle::AsyncRequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        pinnacle_api_key: pinnacle_api_key
      )
    end

    # Checks if a phone number is able to receive RCS
    #
    # @param phone_number [String] The phone number to check for RCS capability
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::CheckRcsCapabilityResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    pinnacle_api_key: "PinnacleApiKey"
    #  )
    #  api.check_rcs_capability(phone_number: "phone_number")
    def check_rcs_capability(phone_number:, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-KEY"] = request_options.pinnacle_api_key unless request_options&.pinnacle_api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "phone_number": phone_number }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/check_rcs"
      end
      Pinnacle::CheckRcsCapabilityResponse.from_json(json_object: response.body)
    end

    # @param webhook_url [String] Webhook URL to receive RCS messages
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::ReceiveRcsMessagesResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    pinnacle_api_key: "PinnacleApiKey"
    #  )
    #  api.receive_rcs_messages
    def receive_rcs_messages(webhook_url: nil, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-KEY"] = request_options.pinnacle_api_key unless request_options&.pinnacle_api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), webhook_url: webhook_url }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/init"
      end
      Pinnacle::ReceiveRcsMessagesResponse.from_json(json_object: response.body)
    end

    # @param request [Pinnacle::RcsMessage, Pinnacle::SmsMessage]
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::RcsMessageSent, Pinnacle::SmsMessageSent]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    pinnacle_api_key: "PinnacleApiKey"
    #  )
    #  api.send_an_rcs_message(request: {  })
    def send_an_rcs_message(request:, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-KEY"] = request_options.pinnacle_api_key unless request_options&.pinnacle_api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/send"
      end
      Pinnacle::SendAnRcsMessageResponse.from_json(json_object: response.body)
    end
  end
end
