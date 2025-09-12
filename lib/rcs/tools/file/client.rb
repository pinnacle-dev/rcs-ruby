# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/file_upload_schema_options"
require_relative "../../types/upload_results"
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
      # @param options [Hash] Additional configurations for your file.Request of type Pinnacle::Tools::File::FileUploadSchemaOptions, as a Hash
      #   * :download (Hash)
      #     * :expires_at (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::UploadResults]
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
      #    options: { download: { expires_at: "2025-06-30T12:00:00.000Z" } }
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
        Pinnacle::UploadResults.from_json(json_object: response.body)
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
      # @param options [Hash] Additional configurations for your file.Request of type Pinnacle::Tools::File::FileUploadSchemaOptions, as a Hash
      #   * :download (Hash)
      #     * :expires_at (String)
      # @param request_options [Pinnacle::RequestOptions]
      # @return [Pinnacle::UploadResults]
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
      #    options: { download: { expires_at: "2025-06-30T12:00:00.000Z" } }
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
          Pinnacle::UploadResults.from_json(json_object: response.body)
        end
      end
    end
  end
end
