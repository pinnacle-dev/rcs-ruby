# frozen_string_literal: true

module Pinnacle
  module Network
    module Requests
      class Client
        # @param client [Pinnacle::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # List Network API request records for your team, sorted newest first. Use filters to audit recent checks by
        # type, status, or your own `clientRef`.
        #
        # <Note>
        #   Limited availability. Contact [founders@pinnacle.sh](mailto:founders@pinnacle.sh) to request access.
        # </Note>
        #
        # @param request_options [Hash]
        # @param params [Pinnacle::Network::Requests::Types::ListNetworkRequestsParams]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Pinnacle::Types::ListNetworkRequestsResponse]
        def list(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "network/requests/list",
            body: Pinnacle::Network::Requests::Types::ListNetworkRequestsParams.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Types::ListNetworkRequestsResponse.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieve one Network API request by ID. The response includes lifecycle timestamps, request status, your
        # `clientRef`, and result fields from the original check.
        #
        # <Note>
        #   Limited availability. Contact [founders@pinnacle.sh](mailto:founders@pinnacle.sh) to request access.
        # </Note>
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Pinnacle::Types::NetworkRequestId] :request_id
        #
        # @return [Pinnacle::Types::NetworkRequestSummary]
        def get(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "network/requests/#{URI.encode_uri_component(params[:request_id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Types::NetworkRequestSummary.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
