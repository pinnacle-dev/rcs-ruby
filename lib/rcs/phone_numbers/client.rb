# frozen_string_literal: true

module Rcs
  module PhoneNumbers
    class Client
      # @param client [Rcs::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Search for available phone numbers that match your exact criteria.
      #
      # @param request_options [Hash]
      # @param params [Rcs::PhoneNumbers::Types::SearchPhoneNumberParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Array[Rcs::Types::PhoneNumberDetails]]
      def search(request_options: {}, **params)
        params = Rcs::Internal::Types::Utils.normalize_keys(params)
        body_prop_names = %i[features location number options type]
        body_bag = params.slice(*body_prop_names)

        request = Rcs::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "phone-numbers/search",
          body: Rcs::PhoneNumbers::Types::SearchPhoneNumberParams.new(body_bag).to_h,
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

      # Purchase one or more phone numbers found through the [search endpoint](./search). <br>
      #
      # Billing uses your account credits and the numbers are ready for immediate use.
      #
      # @param request_options [Hash]
      # @param params [Rcs::PhoneNumbers::Types::BuyPhoneNumberParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Array[Rcs::Types::PurchasedNumber]]
      def buy(request_options: {}, **params)
        params = Rcs::Internal::Types::Utils.normalize_keys(params)
        body_prop_names = %i[numbers]
        body_bag = params.slice(*body_prop_names)

        request = Rcs::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "phone-numbers/buy",
          body: Rcs::PhoneNumbers::Types::BuyPhoneNumberParams.new(body_bag).to_h,
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

      # Retrieve information about any phone number.
      #
      # @param request_options [Hash]
      # @param params [Rcs::PhoneNumbers::Types::RetrievePhoneNumberDetailsParams]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Rcs::PhoneNumbers::Types::PhoneNumbersGetResponse]
      def get(request_options: {}, **params)
        params = Rcs::Internal::Types::Utils.normalize_keys(params)
        body_prop_names = %i[phone level options]
        body_bag = params.slice(*body_prop_names)

        request = Rcs::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "phone-numbers/details",
          body: Rcs::PhoneNumbers::Types::RetrievePhoneNumberDetailsParams.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Rcs::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Rcs::PhoneNumbers::Types::PhoneNumbersGetResponse.load(response.body)
        else
          error_class = Rcs::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Rcs::Webhook::Client]
      def webhook
        @webhook ||= Rcs::PhoneNumbers::Webhook::Client.new(client: @client)
      end

      # @return [Rcs::Campaign::Client]
      def campaign
        @campaign ||= Rcs::PhoneNumbers::Campaign::Client.new(client: @client)
      end
    end
  end
end
