# frozen_string_literal: true

module Rcs
  module Webhooks
    class Client
      # @param client [Rcs::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve all webhook that are set up to receive events for specific URLs or phone numbers.
      #
      # @param request_options [Hash]
      # @param params [Rcs::Webhooks::Types::GetWebhookParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Rcs::Types::WebhookResult]
      def get(request_options: {}, **params)
        params = Rcs::Internal::Types::Utils.normalize_keys(params)
        body_prop_names = %i[identifiers]
        body_bag = params.slice(*body_prop_names)

        request = Rcs::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "webhooks",
          body: Rcs::Webhooks::Types::GetWebhookParams.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rcs::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rcs::Types::WebhookResult.load(response.body)
        else
          error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
