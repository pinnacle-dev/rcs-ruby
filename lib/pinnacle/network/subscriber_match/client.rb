# frozen_string_literal: true

module Pinnacle
  module Network
    module SubscriberMatch
      class Client
        # @param client [Pinnacle::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Compare user-provided identity details against the carrier's subscriber record. Results return match strength
        # per attribute, so you can use partial signals without receiving carrier PII.
        #
        # <Note>
        #   Limited availability. Contact [founders@pinnacle.sh](mailto:founders@pinnacle.sh) to request access.
        # </Note>
        #
        # @param request_options [Hash]
        # @param params [Pinnacle::Network::SubscriberMatch::Types::SubscriberMatchRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Pinnacle::Types::SubscriberMatchResponse]
        def check(request_options: {}, **params)
          params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
          request = Pinnacle::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "network/subscriber-match",
            body: Pinnacle::Network::SubscriberMatch::Types::SubscriberMatchRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Pinnacle::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Pinnacle::Types::SubscriberMatchResponse.load(response.body)
          else
            error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
