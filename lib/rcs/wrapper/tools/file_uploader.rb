# frozen_string_literal: true

require "net/http"
require "uri"

module Rcs
  module Wrapper
    module Tools
      class FileUploader < Rcs::Tools::File::Client
        SUPPORTED_MIME_TYPES = Set.new(
          [
            "audio/mpeg", "audio/mp4", "audio/ogg", "audio/aac",
            "audio/webm", "audio/wav", "audio/3gpp", "audio/amr",
            "video/mp4", "video/mpeg", "video/quicktime", "video/webm",
            "video/3gpp", "video/H264", "video/x-m4v",
            "image/jpeg", "image/png", "image/gif", "image/bmp",
            "image/tiff", "image/webp",
            "application/pdf", "text/csv", "application/rtf",
            "text/vcard", "text/calendar"
          ]
        ).freeze

        MIME_TYPES = {
          ".mp3" => "audio/mpeg",
          ".mp4" => "video/mp4",
          ".ogg" => "audio/ogg",
          ".aac" => "audio/aac",
          ".webm" => "video/webm",
          ".wav" => "audio/wav",
          ".3gp" => "video/3gpp",
          ".3gpp" => "video/3gpp",
          ".amr" => "audio/amr",
          ".mpeg" => "video/mpeg",
          ".mpg" => "video/mpeg",
          ".mov" => "video/quicktime",
          ".m4v" => "video/x-m4v",
          ".jpg" => "image/jpeg",
          ".jpeg" => "image/jpeg",
          ".png" => "image/png",
          ".gif" => "image/gif",
          ".bmp" => "image/bmp",
          ".tiff" => "image/tiff",
          ".tif" => "image/tiff",
          ".webp" => "image/webp",
          ".pdf" => "application/pdf",
          ".csv" => "text/csv",
          ".rtf" => "application/rtf",
          ".vcf" => "text/vcard",
          ".vcard" => "text/vcard",
          ".ics" => "text/calendar"
        }.freeze

        # Upload a file from local filesystem.
        #
        # @example Upload a file
        #   client = Rcs::Client.new(api_key: "your-api-key")
        #   url = client.tools.file.upload_from_path("/path/to/image.png")
        #   puts url # => "https://..."
        #
        # @example Upload with custom name
        #   url = client.tools.file.upload_from_path(
        #     "/path/to/image.png",
        #     name: "my-custom-name.png"
        #   )
        #
        # @param file_path [String] Path to the file
        # @param name [String, nil] Override filename
        # @param options [Hash, nil] Upload options
        # @param request_options [Hash] Additional request options
        #
        # @return [String] Download URL
        # @raise [Rcs::Errors::NotFoundError] If file not found
        # @raise [Rcs::Errors::ClientError] If path is a directory
        # @raise [Rcs::Errors::ServerError] If upload fails
        def upload_from_path(file_path, name: nil, options: nil, request_options: {})
          unless ::File.exist?(file_path)
            raise Rcs::Errors::NotFoundError.new(
              "File not found: #{file_path}",
              code: 404
            )
          end

          if ::File.directory?(file_path)
            raise Rcs::Errors::ClientError.new(
              "Path is a directory, not a file: #{file_path}",
              code: 400
            )
          end

          size = ::File.size(file_path)
          file_name = name || ::File.basename(file_path)
          content_type = get_mime_type(file_path)

          upload_result = upload(
            content_type: content_type,
            size: size,
            name: file_name,
            options: options,
            request_options: request_options
          )

          if upload_result.upload_url
            uri = URI.parse(upload_result.upload_url)
            file_content = ::File.binread(file_path)

            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = uri.scheme == "https"

            request = Net::HTTP::Put.new(uri.request_uri)
            request["Content-Type"] = content_type
            request.body = file_content

            response = http.request(request)

            unless response.is_a?(Net::HTTPSuccess)
              raise Rcs::Errors::ServerError.new(
                "Failed to upload file: #{response.code}",
                code: response.code.to_i
              )
            end
          end

          upload_result.download_url
        end

        private

        def get_mime_type(file_path)
          ext = ::File.extname(file_path).downcase
          mime_type = MIME_TYPES[ext]

          return "application/octet-stream" unless mime_type

          if SUPPORTED_MIME_TYPES.include?(mime_type)
            mime_type
          else
            base_type = mime_type.split("/").first
            if %w[audio video image].include?(base_type)
              warn "MIME type #{mime_type} may not be fully supported. Proceeding anyway."
              mime_type
            else
              "application/octet-stream"
            end
          end
        end
      end
    end
  end
end
