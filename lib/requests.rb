# frozen_string_literal: true

require_relative "environment"
require "faraday"
require "faraday/retry"
require "async/http/faraday"

module Pinnacle
  class RequestClient
    # @return [Faraday]
    attr_reader :conn
    # @return [String]
    attr_reader :base_url
    # @return [String]
    attr_reader :default_environment

    # @param base_url [String]
    # @param environment [Pinnacle::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param pinnacle_api_key [String] Pinnacle API Key for authentication
    # @return [Pinnacle::RequestClient]
    def initialize(pinnacle_api_key:, base_url: nil, environment: Pinnacle::Environment::DEFAULT, max_retries: nil,
                   timeout_in_seconds: nil)
      @default_environment = environment
      @base_url = environment || base_url
      @headers = {}
      @headers["PINNACLE-API-KEY"] = pinnacle_api_key unless pinnacle_api_key.nil?
      @conn = Faraday.new(headers: @headers) do |faraday|
        faraday.request :json
        faraday.response :raise_error, include_request: true
        faraday.request :retry, { max: max_retries } unless max_retries.nil?
        faraday.options.timeout = timeout_in_seconds unless timeout_in_seconds.nil?
      end
    end

    # @param request_options [Pinnacle::RequestOptions]
    # @return [String]
    def get_url(request_options: nil)
      request_options&.base_url || @default_environment || @base_url
    end

    # @return [Hash{String => String}]
    def get_headers
      { "X-Fern-Language": "Ruby", "X-Fern-SDK-Name": "pinnacle_sdk", "X-Fern-SDK-Version": "0.0.1" }
    end
  end

  class AsyncRequestClient
    # @return [Faraday]
    attr_reader :conn
    # @return [String]
    attr_reader :base_url
    # @return [String]
    attr_reader :default_environment

    # @param base_url [String]
    # @param environment [Pinnacle::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param pinnacle_api_key [String] Pinnacle API Key for authentication
    # @return [Pinnacle::AsyncRequestClient]
    def initialize(pinnacle_api_key:, base_url: nil, environment: Pinnacle::Environment::DEFAULT, max_retries: nil,
                   timeout_in_seconds: nil)
      @default_environment = environment
      @base_url = environment || base_url
      @headers = {}
      @headers["PINNACLE-API-KEY"] = pinnacle_api_key unless pinnacle_api_key.nil?
      @conn = Faraday.new(headers: @headers) do |faraday|
        faraday.request :json
        faraday.response :raise_error, include_request: true
        faraday.adapter :async_http
        faraday.request :retry, { max: max_retries } unless max_retries.nil?
        faraday.options.timeout = timeout_in_seconds unless timeout_in_seconds.nil?
      end
    end

    # @param request_options [Pinnacle::RequestOptions]
    # @return [String]
    def get_url(request_options: nil)
      request_options&.base_url || @default_environment || @base_url
    end

    # @return [Hash{String => String}]
    def get_headers
      { "X-Fern-Language": "Ruby", "X-Fern-SDK-Name": "pinnacle_sdk", "X-Fern-SDK-Version": "0.0.1" }
    end
  end

  # Additional options for request-specific configuration when calling APIs via the
  #  SDK.
  class RequestOptions
    # @return [String]
    attr_reader :base_url
    # @return [String] Pinnacle API Key for authentication
    attr_reader :pinnacle_api_key
    # @return [Hash{String => Object}]
    attr_reader :additional_headers
    # @return [Hash{String => Object}]
    attr_reader :additional_query_parameters
    # @return [Hash{String => Object}]
    attr_reader :additional_body_parameters
    # @return [Long]
    attr_reader :timeout_in_seconds

    # @param base_url [String]
    # @param pinnacle_api_key [String] Pinnacle API Key for authentication
    # @param additional_headers [Hash{String => Object}]
    # @param additional_query_parameters [Hash{String => Object}]
    # @param additional_body_parameters [Hash{String => Object}]
    # @param timeout_in_seconds [Long]
    # @return [Pinnacle::RequestOptions]
    def initialize(base_url: nil, pinnacle_api_key: nil, additional_headers: nil, additional_query_parameters: nil,
                   additional_body_parameters: nil, timeout_in_seconds: nil)
      @base_url = base_url
      @pinnacle_api_key = pinnacle_api_key
      @additional_headers = additional_headers
      @additional_query_parameters = additional_query_parameters
      @additional_body_parameters = additional_body_parameters
      @timeout_in_seconds = timeout_in_seconds
    end
  end

  # Additional options for request-specific configuration when calling APIs via the
  #  SDK.
  class IdempotencyRequestOptions
    # @return [String]
    attr_reader :base_url
    # @return [String] Pinnacle API Key for authentication
    attr_reader :pinnacle_api_key
    # @return [Hash{String => Object}]
    attr_reader :additional_headers
    # @return [Hash{String => Object}]
    attr_reader :additional_query_parameters
    # @return [Hash{String => Object}]
    attr_reader :additional_body_parameters
    # @return [Long]
    attr_reader :timeout_in_seconds

    # @param base_url [String]
    # @param pinnacle_api_key [String] Pinnacle API Key for authentication
    # @param additional_headers [Hash{String => Object}]
    # @param additional_query_parameters [Hash{String => Object}]
    # @param additional_body_parameters [Hash{String => Object}]
    # @param timeout_in_seconds [Long]
    # @return [Pinnacle::IdempotencyRequestOptions]
    def initialize(base_url: nil, pinnacle_api_key: nil, additional_headers: nil, additional_query_parameters: nil,
                   additional_body_parameters: nil, timeout_in_seconds: nil)
      @base_url = base_url
      @pinnacle_api_key = pinnacle_api_key
      @additional_headers = additional_headers
      @additional_query_parameters = additional_query_parameters
      @additional_body_parameters = additional_body_parameters
      @timeout_in_seconds = timeout_in_seconds
    end
  end
end
