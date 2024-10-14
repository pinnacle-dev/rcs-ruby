# frozen_string_literal: true

require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "rcs/company/client"
require_relative "rcs/send/client"
require_relative "rcs/types/rcs_functionalities"

module Pinnacle
  class Client
    # @return [Pinnacle::CompanyClient]
    attr_reader :company
    # @return [Pinnacle::SendClient]
    attr_reader :send

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
      @company = Pinnacle::CompanyClient.new(request_client: @request_client)
      @send = Pinnacle::SendClient.new(request_client: @request_client)
    end

    # Retrieve the RCS functionality of a phone number. For example checks if a phone
    #  number can receive RCS message and if it can receive RCS carousels.
    #
    # @param phone_number [String] The phone number to check for RCS functionality. Should be in E.164 format (i.e.
    #  +12345678901).
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::RcsFunctionalities]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.get_rcs_functionality
    def get_rcs_functionality(phone_number: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "phoneNumber": phone_number }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/rcs_functionality"
      end
      Pinnacle::RcsFunctionalities.from_json(json_object: response.body)
    end
  end

  class AsyncClient
    # @return [Pinnacle::AsyncCompanyClient]
    attr_reader :company
    # @return [Pinnacle::AsyncSendClient]
    attr_reader :send

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
      @company = Pinnacle::AsyncCompanyClient.new(request_client: @async_request_client)
      @send = Pinnacle::AsyncSendClient.new(request_client: @async_request_client)
    end

    # Retrieve the RCS functionality of a phone number. For example checks if a phone
    #  number can receive RCS message and if it can receive RCS carousels.
    #
    # @param phone_number [String] The phone number to check for RCS functionality. Should be in E.164 format (i.e.
    #  +12345678901).
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::RcsFunctionalities]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.get_rcs_functionality
    def get_rcs_functionality(phone_number: nil, request_options: nil)
      response = @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-Key"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = { **(request_options&.additional_query_parameters || {}), "phoneNumber": phone_number }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/rcs_functionality"
      end
      Pinnacle::RcsFunctionalities.from_json(json_object: response.body)
    end
  end
end
