# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/upload_file_options"
require_relative "../../types/upload_results"
require_relative "../../types/refreshed_file"
require "json"
require "async"

module Pinnacle
  module Tools
    class FileClient
      # @return [Pinnacle::RequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::RequestClient]
      # @return [Pinnacle::Tools::FileClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Generate presigned URLs that let you upload files directly to our storage and
      #  allow your users to download them securely.
      #
      # @param content_type [String] MIME type of your file. <br>
      #  Supported file types:
      #  - Audio: mp3, mp4, mpeg, ogg, aac, webm, wav, 3gpp, amr
      #  - Video: mp4, mpeg, quicktime, webm, 3gpp, H.264, m4v
      #  - Image: jpeg, png, gif, bmp, tiff, webp
      #  - Documents: pdf, csv, rtf, calendar, vcard
      # @param size [Integer] Size of your file in bytes. Should be less than 100 MB.
      # @param name [String] Name of your file.
      # @param options [Hash] Additional configurations for your file.Request of type Pinnacle::Tools::File::Types::UploadFileOptions, as a Hash
      #   * :delete_at (String)
      #   * :download (Hash)
      #     * :expires_at (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::UploadResults]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.tools.file.upload(
      #    content_type: "image/jpeg",
      #    size: 1024,
      #    name: "test.jpg",
      #    options: { delete_at: "2025-12-31T23:59:59Z", download: { expires_at: "2025-06-30T12:00:00.000Z" } }
      #  )
      def upload(content_type:, size:, name: nil, options: nil, request_options: nil)
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
            contentType: content_type,
            size: size,
            name: name,
            options: options
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/tools/files/upload"
        end
        Pinnacle::Types::UploadResults.from_json(json_object: response.body)
      end

      # Refresh expiring presigned URLs for Pinnacle-hosted files to extend their access
      #  time.
      #  <Callout type="info">
      #  This only works for presigned download URLs. At this moment, you cannot
      #  refresh a presigned upload URL, generate a new one instead.
      #  </Callout>
      #
      # @param urls [Array<String>] Array of file URLs to refresh for extended access. Provided URLs must be
      #  presigned URLs (i.e.
      #  `https://server.trypinnacle.app/storage/v1/object/sign/...`). Invalid or
      #  external URLs will be returned unchanged in the response.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Array<Pinnacle::Types::RefreshedFile>]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.tools.file.refresh(urls: ["https://server.trypinnacle.app/storage/v1/object/sign/vault/3/test.jpg?token=oldtoken", "https://server.trypinnacle.app/storage/v1/object/sign/vault/3/document.pdf?token=oldtoken2", "invalid/url", "https://google.com"])
      def refresh(urls:, request_options: nil)
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
          req.body = { **(request_options&.additional_body_parameters || {}), urls: urls }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/tools/files/refresh"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          Pinnacle::Types::RefreshedFile.from_json(json_object: item)
        end
      end
    end

    class AsyncFileClient
      # @return [Pinnacle::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Pinnacle::AsyncRequestClient]
      # @return [Pinnacle::Tools::AsyncFileClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Generate presigned URLs that let you upload files directly to our storage and
      #  allow your users to download them securely.
      #
      # @param content_type [String] MIME type of your file. <br>
      #  Supported file types:
      #  - Audio: mp3, mp4, mpeg, ogg, aac, webm, wav, 3gpp, amr
      #  - Video: mp4, mpeg, quicktime, webm, 3gpp, H.264, m4v
      #  - Image: jpeg, png, gif, bmp, tiff, webp
      #  - Documents: pdf, csv, rtf, calendar, vcard
      # @param size [Integer] Size of your file in bytes. Should be less than 100 MB.
      # @param name [String] Name of your file.
      # @param options [Hash] Additional configurations for your file.Request of type Pinnacle::Tools::File::Types::UploadFileOptions, as a Hash
      #   * :delete_at (String)
      #   * :download (Hash)
      #     * :expires_at (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::Types::UploadResults]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.tools.file.upload(
      #    content_type: "image/jpeg",
      #    size: 1024,
      #    name: "test.jpg",
      #    options: { delete_at: "2025-12-31T23:59:59Z", download: { expires_at: "2025-06-30T12:00:00.000Z" } }
      #  )
      def upload(content_type:, size:, name: nil, options: nil, request_options: nil)
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
              contentType: content_type,
              size: size,
              name: name,
              options: options
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/tools/files/upload"
          end
          Pinnacle::Types::UploadResults.from_json(json_object: response.body)
        end
      end

      # Refresh expiring presigned URLs for Pinnacle-hosted files to extend their access
      #  time.
      #  <Callout type="info">
      #  This only works for presigned download URLs. At this moment, you cannot
      #  refresh a presigned upload URL, generate a new one instead.
      #  </Callout>
      #
      # @param urls [Array<String>] Array of file URLs to refresh for extended access. Provided URLs must be
      #  presigned URLs (i.e.
      #  `https://server.trypinnacle.app/storage/v1/object/sign/...`). Invalid or
      #  external URLs will be returned unchanged in the response.
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Array<Pinnacle::Types::RefreshedFile>]
      # @example
      #  api = Pinnacle::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Pinnacle::Environment::DEFAULT,
      #    api_key: "YOUR_API_KEY"
      #  )
      #  api.tools.file.refresh(urls: ["https://server.trypinnacle.app/storage/v1/object/sign/vault/3/test.jpg?token=oldtoken", "https://server.trypinnacle.app/storage/v1/object/sign/vault/3/document.pdf?token=oldtoken2", "invalid/url", "https://google.com"])
      def refresh(urls:, request_options: nil)
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
            req.body = { **(request_options&.additional_body_parameters || {}), urls: urls }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/tools/files/refresh"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |item|
            item = item.to_json
            Pinnacle::Types::RefreshedFile.from_json(json_object: item)
          end
        end
      end
    end
  end
end
