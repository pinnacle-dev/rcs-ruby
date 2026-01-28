# frozen_string_literal: true

module Pinnacle
  module Tools
    module File
      class Client
        # @param client [Pinnacle::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Generate presigned URLs that let you upload files directly to our storage and allow your users to download
        # them securely.
        #
        # @param request_options [Hash]
        # @param params [Pinnacle::Tools::File::Types::UploadFileParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Pinnacle::Types::UploadResults]
        def upload(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "tools/files/upload",
            body: Pinnacle::Tools::File::Types::UploadFileParams.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Types::UploadResults.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Refresh expiring presigned URLs for Pinnacle-hosted files to extend their access time.
        #
        # <Callout type="info">
        # This only works for presigned download URLs. At this moment, you cannot refresh a presigned upload URL,
        # generate a new one instead.
        # </Callout>
        #
        # @param request_options [Hash]
        # @param params [Pinnacle::Tools::File::Types::RefreshFileParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Array[Pinnacle::Types::RefreshedFile]]
        def refresh(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "tools/files/refresh",
            body: Pinnacle::Tools::File::Types::RefreshFileParams.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          return if code.between?(200, 299)

          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
