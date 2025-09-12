# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/create_url_options"
require_relative "../../types/shortened_url"
require_relative "../../types/shortened_url_with_click_data"
require "async"

module Pinnacle
  module Tools
    class UrlClient
      # @return [Pinnacle::RequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::Tools::UrlClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Create a shortened URL that redirects visitors to the provided destination URL.
      #
      # @param url [String] Destination URL for the shortened link that visitors will be redirected to when
      #  clicked.
      # @param options [Hash] Request of type Pinnacle::CreateUrlOptions, as a Hash
      #   * :expires_at (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::ShortenedUrl]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.tools.url.create(url: "https://www.pinnacle.sh/", options: { expires_at: "2025-06-23T16:18:25.000Z" })
      def create(url:, options: nil, request_options: nil)
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
          req.body = { **(request_options&.additional_body_parameters || {}), url: url, options: options }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/tools/url"
        end
        Pinnacle::ShortenedUrl.from_json(json_object: response.body)
      end

      # Retrieve configuration and details for your shortened URL using its unique
      #  identifier.
      #
      # @param link_id [String] Unique identifier from your shortened URL. For example, for
      #  `https://pncl.to/ePzVxILF`, the `linkId` is `ePzVxILF`. <br>
      #  See the response of [Create Shortened URL](./create-url) for more information.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::ShortenedUrlWithClickData]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.tools.url.get(link_id: "ePzVxILF")
      def get(link_id:, request_options: nil)
        response = @request_client.conn.get do |req|
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
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/tools/url/#{link_id}"
        end
        Pinnacle::ShortenedUrlWithClickData.from_json(json_object: response.body)
      end

      # Update the destination or configuration of an existing shortened URL.
      #
      # @param link_id [String] Unique identifier from your shortened URL. For example, for
      #  `https://pncl.to/ePzVxILF`, the `linkId` is `ePzVxILF`. <br>
      #  See the response of [Create Shortened URL](./create-url) for more information.
      # @param url [String] New destination URL where your visitors will be redirected.
      # @param options [Hash] Request of type Pinnacle::CreateUrlOptions, as a Hash
      #   * :expires_at (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::ShortenedUrl]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.tools.url.update(link_id: "ePzVxILF", url: "https://www.pinnacle.sh/")
      def update(link_id:, url: nil, options: nil, request_options: nil)
        response = @request_client.conn.put do |req|
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
          req.body = { **(request_options&.additional_body_parameters || {}), url: url, options: options }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/tools/url/#{link_id}"
        end
        Pinnacle::ShortenedUrl.from_json(json_object: response.body)
      end
    end

    class AsyncUrlClient
      # @return [Pinnacle::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::Tools::AsyncUrlClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Create a shortened URL that redirects visitors to the provided destination URL.
      #
      # @param url [String] Destination URL for the shortened link that visitors will be redirected to when
      #  clicked.
      # @param options [Hash] Request of type Pinnacle::CreateUrlOptions, as a Hash
      #   * :expires_at (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::ShortenedUrl]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.tools.url.create(url: "https://www.pinnacle.sh/", options: { expires_at: "2025-06-23T16:18:25.000Z" })
      def create(url:, options: nil, request_options: nil)
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
            req.body = { **(request_options&.additional_body_parameters || {}), url: url, options: options }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/tools/url"
          end
          Pinnacle::ShortenedUrl.from_json(json_object: response.body)
        end
      end

      # Retrieve configuration and details for your shortened URL using its unique
      #  identifier.
      #
      # @param link_id [String] Unique identifier from your shortened URL. For example, for
      #  `https://pncl.to/ePzVxILF`, the `linkId` is `ePzVxILF`. <br>
      #  See the response of [Create Shortened URL](./create-url) for more information.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::ShortenedUrlWithClickData]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.tools.url.get(link_id: "ePzVxILF")
      def get(link_id:, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
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
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/tools/url/#{link_id}"
          end
          Pinnacle::ShortenedUrlWithClickData.from_json(json_object: response.body)
        end
      end

      # Update the destination or configuration of an existing shortened URL.
      #
      # @param link_id [String] Unique identifier from your shortened URL. For example, for
      #  `https://pncl.to/ePzVxILF`, the `linkId` is `ePzVxILF`. <br>
      #  See the response of [Create Shortened URL](./create-url) for more information.
      # @param url [String] New destination URL where your visitors will be redirected.
      # @param options [Hash] Request of type Pinnacle::CreateUrlOptions, as a Hash
      #   * :expires_at (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::ShortenedUrl]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.tools.url.update(link_id: "ePzVxILF", url: "https://www.pinnacle.sh/")
      def update(link_id:, url: nil, options: nil, request_options: nil)
        Async do
          response = @request_client.conn.put do |req|
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
            req.body = { **(request_options&.additional_body_parameters || {}), url: url, options: options }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/tools/url/#{link_id}"
          end
          Pinnacle::ShortenedUrl.from_json(json_object: response.body)
        end
      end
    end
  end
end
