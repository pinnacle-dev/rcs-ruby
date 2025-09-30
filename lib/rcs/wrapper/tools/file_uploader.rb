# frozen_string_literal: true

require_relative "../../tools/file/client"
require "net/http"
require "uri"
require "faraday"

module Pinnacle
  module Tools
    # Enhanced File client with file upload from path capabilities
    class FileUploader < FileClient
      # Supported MIME types for file uploads
      SUPPORTED_MIME_TYPES = Set.new([
        "audio/mpeg",
        "audio/mp4",
        "audio/ogg",
        "audio/aac",
        "audio/webm",
        "audio/wav",
        "audio/3gpp",
        "audio/amr",
        "video/mp4",
        "video/mpeg",
        "video/quicktime",
        "video/webm",
        "video/3gpp",
        "video/H264",
        "video/x-m4v",
        "image/jpeg",
        "image/png",
        "image/gif",
        "image/bmp",
        "image/tiff",
        "image/webp",
        "application/pdf",
        "text/csv",
        "application/rtf",
        "text/vcard",
        "text/calendar"
      ]).freeze

      # Upload a file from a file path
      #
      # @param file_input [String, File, Pathname] File path string or File/Pathname object to upload
      # @param name [String, nil] Optional custom name for the uploaded file. Defaults to basename of file_input
      # @param options [Hash, nil] Additional upload options
      # @param request_options [Pinnacle::RequestOptions, nil] Additional request options
      # @return [String] The download URL of the uploaded file
      # @raise [Faraday::BadRequestError] If file_input is not a valid file path or object
      # @raise [Faraday::NotFoundError] If the file does not exist
      # @raise [Faraday::ServerError] If file reading or upload fails
      # @example Upload a file
      #   uploader = Pinnacle::Tools::FileUploader.new(request_client: request_client)
      #   download_url = uploader.upload_from_path("/path/to/image.jpg")
      #
      # @example Upload with custom name
      #   download_url = uploader.upload_from_path(
      #     "/path/to/image.jpg",
      #     name: "custom-name.jpg"
      #   )
      #
      # @example Upload with options
      #   download_url = uploader.upload_from_path(
      #     "/path/to/document.pdf",
      #     options: { download: { expires_at: "2025-12-31T23:59:59Z" } }
      #   )
      def upload_from_path(file_input, name: nil, options: nil, request_options: nil)
        # Validate and normalize file path
        file_path = validate_and_normalize_path(file_input)

        # Check if file exists
        unless ::File.exist?(file_path)
          raise Faraday::ResourceNotFound.new("File not found: #{file_path}")
        end

        # Check if path is a directory
        if ::File.directory?(file_path)
          raise Faraday::BadRequestError.new("Path is a directory, not a file: #{file_path}")
        end

        # Get file metadata
        begin
          size = ::File.size(file_path)
          file_name = name || ::File.basename(file_path)
          content_type = get_mime_type(file_path)
        rescue StandardError => e
          raise Faraday::ServerError.new("Failed to access file: #{e.message}")
        end

        # Upload file metadata to get presigned URLs
        upload_result = upload(
          content_type: content_type,
          size: size,
          name: file_name,
          options: options,
          request_options: request_options
        )

        # Upload file to presigned URL if provided
        if upload_result.upload_url
          upload_file_to_url(file_path, upload_result.upload_url, content_type)
        end

        upload_result.download_url
      end

      private

      # Validate and normalize file input to a path string
      # @param file_input [String, File, Pathname] File path or object
      # @return [String] Normalized file path
      # @raise [Faraday::BadRequestError] If file_input type is invalid
      def validate_and_normalize_path(file_input)
        case file_input
        when String
          file_input
        when ::File
          file_input.path
        when Pathname
          file_input.to_s
        else
          raise Faraday::BadRequestError.new(
            "file_input must be a String path, File object, or Pathname. Got: #{file_input.class}"
          )
        end
      end

      # Determine MIME type from file path
      # @param file_path [String] Path to the file
      # @return [String] MIME type string
      def get_mime_type(file_path)
        # Try to detect MIME type from file extension
        extension = ::File.extname(file_path).downcase
        mime_type = MIME_TYPE_MAP[extension]

        return mime_type if mime_type

        # If not found in map, try to infer from content or use default
        "application/octet-stream"
      end

      # Upload file content to presigned URL
      # @param file_path [String] Path to the file to upload
      # @param upload_url [String] Presigned URL for upload
      # @param content_type [String] MIME type of the file
      # @raise [Faraday::ServerError] If upload fails
      def upload_file_to_url(file_path, upload_url, content_type)
        uri = URI.parse(upload_url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")

        request = Net::HTTP::Put.new(uri.request_uri)
        request["Content-Type"] = content_type
        request.body = ::File.read(file_path)

        response = http.request(request)

        unless response.is_a?(Net::HTTPSuccess) || response.is_a?(Net::HTTPRedirection)
          raise Faraday::ServerError.new(
            "Failed to upload file to storage: #{response.code} #{response.message}"
          )
        end
      rescue StandardError => e
        raise Faraday::ServerError.new("Failed to upload file: #{e.message}")
      end

      # Map of file extensions to MIME types
      MIME_TYPE_MAP = {
        # Audio
        ".mp3" => "audio/mpeg",
        ".m4a" => "audio/mp4",
        ".ogg" => "audio/ogg",
        ".oga" => "audio/ogg",
        ".aac" => "audio/aac",
        ".webm" => "audio/webm",
        ".wav" => "audio/wav",
        ".3gp" => "audio/3gpp",
        ".3gpp" => "audio/3gpp",
        ".amr" => "audio/amr",

        # Video
        ".mp4" => "video/mp4",
        ".mpeg" => "video/mpeg",
        ".mpg" => "video/mpeg",
        ".mov" => "video/quicktime",
        # ".webm" => "video/webm",  # Commented to avoid duplicate
        # ".3gp" => "video/3gpp",    # Commented to avoid duplicate
        # ".3gpp" => "video/3gpp",   # Commented to avoid duplicate
        ".h264" => "video/H264",
        ".m4v" => "video/x-m4v",

        # Image
        ".jpg" => "image/jpeg",
        ".jpeg" => "image/jpeg",
        ".png" => "image/png",
        ".gif" => "image/gif",
        ".bmp" => "image/bmp",
        ".tif" => "image/tiff",
        ".tiff" => "image/tiff",
        ".webp" => "image/webp",

        # Documents
        ".pdf" => "application/pdf",
        ".csv" => "text/csv",
        ".rtf" => "application/rtf",
        ".vcf" => "text/vcard",
        ".vcard" => "text/vcard",
        ".ics" => "text/calendar",
        ".ical" => "text/calendar"
      }.freeze
    end

    # Async version of FileUploader
    class AsyncFileUploader < AsyncFileClient
      # Supported MIME types for file uploads
      SUPPORTED_MIME_TYPES = FileUploader::SUPPORTED_MIME_TYPES

      # Upload a file from a file path asynchronously
      #
      # @param file_input [String, File, Pathname] File path string or File/Pathname object to upload
      # @param name [String, nil] Optional custom name for the uploaded file
      # @param options [Hash, nil] Additional upload options
      # @param request_options [Pinnacle::RequestOptions, nil] Additional request options
      # @return [String] The download URL of the uploaded file wrapped in Async
      # @raise [Faraday::BadRequestError] If file_input is not a valid file path or object
      # @raise [Faraday::ResourceNotFound] If the file does not exist
      # @raise [Faraday::ServerError] If file reading or upload fails
      def upload_from_path(file_input, name: nil, options: nil, request_options: nil)
        Async do
          file_path = validate_and_normalize_path(file_input)

          unless ::File.exist?(file_path)
            raise Faraday::ResourceNotFound.new("File not found: #{file_path}")
          end

          if ::File.directory?(file_path)
            raise Faraday::BadRequestError.new("Path is a directory, not a file: #{file_path}")
          end

          begin
            size = ::File.size(file_path)
            file_name = name || ::File.basename(file_path)
            content_type = get_mime_type(file_path)
          rescue StandardError => e
            raise Faraday::ServerError.new("Failed to access file: #{e.message}")
          end

          upload_result = upload(
            content_type: content_type,
            size: size,
            name: file_name,
            options: options,
            request_options: request_options
          ).wait

          if upload_result.upload_url
            upload_file_to_url(file_path, upload_result.upload_url, content_type)
          end

          upload_result.download_url
        end
      end

      private

      def validate_and_normalize_path(file_input)
        case file_input
        when String
          file_input
        when File
          file_input.path
        when Pathname
          file_input.to_s
        else
          raise Faraday::BadRequestError.new(
            "file_input must be a String path, File object, or Pathname. Got: #{file_input.class}"
          )
        end
      end

      def get_mime_type(file_path)
        extension = ::File.extname(file_path).downcase
        mime_type = FileUploader::MIME_TYPE_MAP[extension]
        mime_type || "application/octet-stream"
      end

      def upload_file_to_url(file_path, upload_url, content_type)
        uri = URI.parse(upload_url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")

        request = Net::HTTP::Put.new(uri.request_uri)
        request["Content-Type"] = content_type
        request.body = ::File.read(file_path)

        response = http.request(request)

        unless response.is_a?(Net::HTTPSuccess) || response.is_a?(Net::HTTPRedirection)
          raise Faraday::ServerError.new(
            "Failed to upload file to storage: #{response.code} #{response.message}"
          )
        end
      rescue StandardError => e
        raise Faraday::ServerError.new("Failed to upload file: #{e.message}")
      end
    end
  end
end
