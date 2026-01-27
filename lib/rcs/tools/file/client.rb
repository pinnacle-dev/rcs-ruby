# frozen_string_literal: true

module Rcs
  module Tools
    module File
      class Client
        # @param client [Rcs::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Generate presigned URLs that let you upload files directly to our storage and allow your users to download
        # them securely.
        #
        # @param request_options [Hash]
        # @param params [Rcs::Tools::File::Types::UploadFileParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Rcs::Types::UploadResults]
        def upload(request_options: {}, **params)
          params = Rcs::Internal::Types::Utils.normalize_keys(params)
          body_prop_names = %i[content_type size name options]
          body_bag = params.slice(*body_prop_names)

          request = Rcs::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "tools/files/upload",
            body: Rcs::Tools::File::Types::UploadFileParams.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rcs::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rcs::Types::UploadResults.load(response.body)
          else
            error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
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
        # @param params [Rcs::Tools::File::Types::RefreshFileParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Array[Rcs::Types::RefreshedFile]]
        def refresh(request_options: {}, **params)
          params = Rcs::Internal::Types::Utils.normalize_keys(params)
          body_prop_names = %i[urls]
          body_bag = params.slice(*body_prop_names)

          request = Rcs::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "tools/files/refresh",
            body: Rcs::Tools::File::Types::RefreshFileParams.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rcs::Errors::TimeoutError
          end
          code = response.code.to_i
          return if code.between?(200, 299)

          error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
