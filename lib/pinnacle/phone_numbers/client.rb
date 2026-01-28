# frozen_string_literal: true

module Pinnacle
  module PhoneNumbers
    class Client
      # @param client [Pinnacle::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Search for available phone numbers that match your exact criteria.
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::PhoneNumbers::Types::SearchPhoneNumberParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Array[Pinnacle::Types::PhoneNumberDetails]]
      def search(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "phone-numbers/search",
          body: Pinnacle::PhoneNumbers::Types::SearchPhoneNumberParams.new(params).to_h,
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

      # Purchase one or more phone numbers found through the [search endpoint](./search). <br>
      #
      # Billing uses your account credits and the numbers are ready for immediate use.
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::PhoneNumbers::Types::BuyPhoneNumberParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Array[Pinnacle::Types::PurchasedNumber]]
      def buy(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "phone-numbers/buy",
          body: Pinnacle::PhoneNumbers::Types::BuyPhoneNumberParams.new(params).to_h,
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

      # Retrieve information about any phone number.
      #
      # @param request_options [Hash]
      # @param params [Pinnacle::PhoneNumbers::Types::RetrievePhoneNumberDetailsParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Pinnacle::PhoneNumbers::Types::PhoneNumbersGetResponse]
      def get(request_options: {}, **params)
        params = Pinnacle::Internal::Types::Utils.normalize_keys(params)
        request = Pinnacle::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "phone-numbers/details",
          body: Pinnacle::PhoneNumbers::Types::RetrievePhoneNumberDetailsParams.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Pinnacle::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Pinnacle::PhoneNumbers::Types::PhoneNumbersGetResponse.load(response.body)
        else
          error_class = Pinnacle::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Pinnacle::Webhook::Client]
      def webhook
        @webhook ||= Pinnacle::PhoneNumbers::Webhook::Client.new(client: @client)
      end

      # @return [Pinnacle::Campaign::Client]
      def campaign
        @campaign ||= Pinnacle::PhoneNumbers::Campaign::Client.new(client: @client)
      end
    end
  end
end
