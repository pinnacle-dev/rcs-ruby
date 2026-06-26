# frozen_string_literal: true

module Pinnacle
  module Network
    module SilentAuth
      class Client
        # @param client [Pinnacle::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Start a Silent Authentication session to verify that the user controls the device attached to a phone number.
        # Omit `format` to receive a `browserUrl` for the hosted browser/WebView flow, or set `format: "json"` to
        # receive a `jsonUrl` for a native mobile app or custom client-side flow. The device check must run from the
        # user's cellular device, not your server.
        #
        # The returned URL expires 60 seconds after creation. Open or fetch it immediately and use `expiresAt` to detect
        # when a new Silent Auth session is required.
        #
        # <Note>
        #   Limited availability. Contact [founders@pinnacle.sh](mailto:founders@pinnacle.sh) to request access.
        # </Note>
        #
        # @param request_options [Hash]
        # @param params [Pinnacle::Network::SilentAuth::Types::SilentAuthRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Pinnacle::Types::SilentAuthResponse]
        def start(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "network/silent-auth",
            body: Pinnacle::Network::SilentAuth::Types::SilentAuthRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Types::SilentAuthResponse.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Complete a Silent Authentication request by exchanging the code returned from the JSON flow. Call this from
        # your server after the user's mobile app fetches `jsonUrl`.
        #
        # This endpoint returns a terminal verification result. To inspect pending lifecycle states such as `started` or
        # `challenge-issued`, use [Get Network Request](/api-reference/network/get-network-request).
        #
        # <Note>
        #   Limited availability. Contact [founders@pinnacle.sh](mailto:founders@pinnacle.sh) to request access.
        # </Note>
        #
        # @param request_options [Hash]
        # @param params [Pinnacle::Network::SilentAuth::Types::SilentAuthCheckRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Pinnacle::Types::NetworkRequestId] :request_id
        #
        # @return [Pinnacle::Types::SilentAuthCheckResponse]
        def check(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request_data = Pinnacle::Network::SilentAuth::Types::SilentAuthCheckRequest.new(params).to_h
          non_body_param_names = %w[requestId]
          body = request_data.except(*non_body_param_names)

          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "network/silent-auth/#{URI.encode_uri_component(params[:request_id].to_s)}/check",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Types::SilentAuthCheckResponse.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
