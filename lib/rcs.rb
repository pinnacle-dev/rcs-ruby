# frozen_string_literal: true

require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "rcs/types/check_rcs_capability_response"
require_relative "rcs/types/update_settings_response"
require_relative "rcs/types/get_account_number_response"
require_relative "rcs/types/send_request"
require_relative "rcs/types/send_response"

module Pinnacle
  class Client
    # @param base_url [String]
    # @param environment [Pinnacle::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @return [Pinnacle::Client]
    def initialize(api_key:, base_url: nil, environment: Pinnacle::Environment::DEFAULT, max_retries: nil,
                   timeout_in_seconds: nil)
      @request_client = Pinnacle::RequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        api_key: api_key
      )
    end

    # Checks if a phone number is able to receive RCS
    #
    # @param phone_number [String] Phone number (E.164 format: [+][country code][subscriber number including area
    #  code]) to check for RCS capability. Example: +1234567890
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::CheckRcsCapabilityResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.check_rcs_capability(phone_number: "phone_number")
    def check_rcs_capability(phone_number:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
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

    # Initializes settings related to RCS messaging, including webhook registration.
    #
    # @param webhook_url [String] Webhook URL to receive inbound messages
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::UpdateSettingsResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.update_settings(webhook_url: "webhook_url")
    def update_settings(webhook_url:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), webhook_url: webhook_url }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/update_settings"
      end
      Pinnacle::UpdateSettingsResponse.from_json(json_object: response.body)
    end

    # Retrieve the phone number associated with the account.
    #
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::GetAccountNumberResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.get_account_number
    def get_account_number(request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/get_account_number"
      end
      Pinnacle::GetAccountNumberResponse.from_json(json_object: response.body)
    end

    # Send a SMS or RCS message to a phone number
    #
    # @param request [Pinnacle::CardRcs, Pinnacle::Sms, Pinnacle::BasicRcs, Pinnacle::MediaRcs, Pinnacle::CarouselRcs]
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::SendResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.send(request: { phone_number: "phone_number", message_type: "card", message: { cards: [{ title: "title" }] } })
    def send(request:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
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
      Pinnacle::SendResponse.from_json(json_object: response.body)
    end
  end

  class AsyncClient
    # @param base_url [String]
    # @param environment [Pinnacle::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @return [Pinnacle::AsyncClient]
    def initialize(api_key:, base_url: nil, environment: Pinnacle::Environment::DEFAULT, max_retries: nil,
                   timeout_in_seconds: nil)
      @async_request_client = Pinnacle::AsyncRequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        api_key: api_key
      )
    end

    # Checks if a phone number is able to receive RCS
    #
    # @param phone_number [String] Phone number (E.164 format: [+][country code][subscriber number including area
    #  code]) to check for RCS capability. Example: +1234567890
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::CheckRcsCapabilityResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.check_rcs_capability(phone_number: "phone_number")
    def check_rcs_capability(phone_number:, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
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

    # Initializes settings related to RCS messaging, including webhook registration.
    #
    # @param webhook_url [String] Webhook URL to receive inbound messages
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::UpdateSettingsResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.update_settings(webhook_url: "webhook_url")
    def update_settings(webhook_url:, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), webhook_url: webhook_url }.compact
        req.url "#{@async_request_client.get_url(request_options: request_options)}/update_settings"
      end
      Pinnacle::UpdateSettingsResponse.from_json(json_object: response.body)
    end

    # Retrieve the phone number associated with the account.
    #
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::GetAccountNumberResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.get_account_number
    def get_account_number(request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/get_account_number"
      end
      Pinnacle::GetAccountNumberResponse.from_json(json_object: response.body)
    end

    # Send a SMS or RCS message to a phone number
    #
    # @param request [Pinnacle::CardRcs, Pinnacle::Sms, Pinnacle::BasicRcs, Pinnacle::MediaRcs, Pinnacle::CarouselRcs]
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::SendResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.send(request: { phone_number: "phone_number", message_type: "card", message: { cards: [{ title: "title" }] } })
    def send(request:, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
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
      Pinnacle::SendResponse.from_json(json_object: response.body)
    end
  end
end
