# frozen_string_literal: true

require_relative "../../requests"
require "date"
require_relative "types/tools_shorten_url_response"
require_relative "types/tools_upload_url_response"
require "async"

module Pinnacle
  class ToolsClient
    # @return [Pinnacle::RequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::RequestClient]
    # @return [Pinnacle::ToolsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Create a shortened URL with an optional expiration date (default and max
    #  expiration is 90 days). The shortened URL will redirect to the original URL and
    #  will have the following format https://urls.p1n.io/ABCD5678.
    #
    # @param url [String] The URL to be shortened. Must be a valid URL with either http or https protocol.
    # @param expires_at [DateTime] Optional expiration date for the shortened URL in ISO 8601 format. Default and
    #  max expiration is 90 days.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Tools::ToolsShortenUrlResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.tools.shorten_url(url: "https://example.com")
    def shorten_url(url:, expires_at: nil, request_options: nil)
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
        req.body = { **(request_options&.additional_body_parameters || {}), url: url, expiresAt: expires_at }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/tools/urls/shorten"
      end
      Pinnacle::Tools::ToolsShortenUrlResponse.from_json(json_object: response.body)
    end

    # Generate signed upload (expires in 2 hours) and download URLs for a file
    #  (expires in 1 hour).
    #
    # @param content_type [String] The MIME type of the file.
    #  Supported types are audio/basic, audio/L24, audio/mp4, audio/mpeg, audio/mpg,
    #  audio/mp3, audio/ogg, audio/aac, audio/vndrn-realaudio, audio/vndwave,
    #  audio/3gpp, audio/3gpp2, audio/ac3, audio/webm, audio/amrnb, audio/amr,
    #  video/mpeg, video/mp4, video/quicktime, video/webm, video/3gpp, video/3gpp2,
    #  video/3gpptt, video/H261, video/H263, video/H2631998, video/H2632000,
    #  video/H264, video/m4v, video/mpeg4, video/webm, image/jpeg, image/gif,
    #  image/png, image/gif, image/bmp, image/tiff, image/webp, text/vcard,
    #  text/xvcard, text/csv, text/rtf, text/richtext, text/calendar, text/directory,
    #  application/ogg, application/pdf, application/vcard,
    #  application/vndapple.pkpass.
    # @param size [Integer] The size of the file in bytes. Should be less than 100 MB.
    # @param name [String] The name of the file.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Tools::ToolsUploadUrlResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.tools.upload_url(
    #    content_type: "image/png",
    #    size: 1024,
    #    name: "example.png"
    #  )
    def upload_url(content_type:, size:, name:, request_options: nil)
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
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          contentType: content_type,
          size: size,
          name: name
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/tools/uploadUrl"
      end
      Pinnacle::Tools::ToolsUploadUrlResponse.from_json(json_object: response.body)
    end
  end

  class AsyncToolsClient
    # @return [Pinnacle::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::AsyncRequestClient]
    # @return [Pinnacle::AsyncToolsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Create a shortened URL with an optional expiration date (default and max
    #  expiration is 90 days). The shortened URL will redirect to the original URL and
    #  will have the following format https://urls.p1n.io/ABCD5678.
    #
    # @param url [String] The URL to be shortened. Must be a valid URL with either http or https protocol.
    # @param expires_at [DateTime] Optional expiration date for the shortened URL in ISO 8601 format. Default and
    #  max expiration is 90 days.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Tools::ToolsShortenUrlResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.tools.shorten_url(url: "https://example.com")
    def shorten_url(url:, expires_at: nil, request_options: nil)
      Async do
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
          req.body = { **(request_options&.additional_body_parameters || {}), url: url, expiresAt: expires_at }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/tools/urls/shorten"
        end
        Pinnacle::Tools::ToolsShortenUrlResponse.from_json(json_object: response.body)
      end
    end

    # Generate signed upload (expires in 2 hours) and download URLs for a file
    #  (expires in 1 hour).
    #
    # @param content_type [String] The MIME type of the file.
    #  Supported types are audio/basic, audio/L24, audio/mp4, audio/mpeg, audio/mpg,
    #  audio/mp3, audio/ogg, audio/aac, audio/vndrn-realaudio, audio/vndwave,
    #  audio/3gpp, audio/3gpp2, audio/ac3, audio/webm, audio/amrnb, audio/amr,
    #  video/mpeg, video/mp4, video/quicktime, video/webm, video/3gpp, video/3gpp2,
    #  video/3gpptt, video/H261, video/H263, video/H2631998, video/H2632000,
    #  video/H264, video/m4v, video/mpeg4, video/webm, image/jpeg, image/gif,
    #  image/png, image/gif, image/bmp, image/tiff, image/webp, text/vcard,
    #  text/xvcard, text/csv, text/rtf, text/richtext, text/calendar, text/directory,
    #  application/ogg, application/pdf, application/vcard,
    #  application/vndapple.pkpass.
    # @param size [Integer] The size of the file in bytes. Should be less than 100 MB.
    # @param name [String] The name of the file.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Tools::ToolsUploadUrlResponse]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.tools.upload_url(
    #    content_type: "image/png",
    #    size: 1024,
    #    name: "example.png"
    #  )
    def upload_url(content_type:, size:, name:, request_options: nil)
      Async do
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
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            contentType: content_type,
            size: size,
            name: name
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/tools/uploadUrl"
        end
        Pinnacle::Tools::ToolsUploadUrlResponse.from_json(json_object: response.body)
      end
    end
  end
end
