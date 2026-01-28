# frozen_string_literal: true

module Rcs
  module Tools
    module Url
      class Client
        # @param client [Rcs::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Create a shortened URL that redirects visitors to the provided destination URL.
        #
        # @param request_options [Hash]
        # @param params [Rcs::Tools::Url::Types::CreateUrlParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Rcs::Types::ShortenedUrl]
        def create(request_options: {}, **params)
          params = Rcs::Internal::Types::Utils.normalize_keys(params)
          body_prop_names = %i[url options]
          body_bag = params.slice(*body_prop_names)

          request = Rcs::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "tools/url",
            body: Rcs::Tools::Url::Types::CreateUrlParams.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rcs::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rcs::Types::ShortenedUrl.load(response.body)
          else
            error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieve configuration and details for your shortened URL using its unique identifier.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :link_id
        #
        # @return [Rcs::Types::ShortenedUrlWithClickData]
        def get(request_options: {}, **params)
          params = Rcs::Internal::Types::Utils.normalize_keys(params)
          request = Rcs::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "tools/url/#{params[:link_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rcs::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rcs::Types::ShortenedUrlWithClickData.load(response.body)
          else
            error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Update the destination or expiration date of an existing shortened URL. Expiring links cannot be updated into
        # a permalink.
        #
        # @param request_options [Hash]
        # @param params [Rcs::Tools::Url::Types::UpdateUrlParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :link_id
        #
        # @return [Rcs::Types::ShortenedUrl]
        def update(request_options: {}, **params)
          params = Rcs::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[link_id]
          body_params = params.except(*path_param_names)
          body_prop_names = %i[url options]
          body_bag = body_params.slice(*body_prop_names)

          request = Rcs::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "tools/url/#{params[:link_id]}",
            body: Rcs::Tools::Url::Types::UpdateUrlParams.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Rcs::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Rcs::Types::ShortenedUrl.load(response.body)
          else
            error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
