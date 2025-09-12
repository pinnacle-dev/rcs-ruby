# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/phone_feature_enum"
require_relative "types/search_schema_location"
require_relative "types/search_schema_number"
require_relative "types/search_schema_options"
require_relative "../types/phone_enum"
require_relative "../types/phone_number_details"
require "json"
require_relative "../types/purchased_number"
require_relative "types/phone_details_schema_level"
require_relative "types/phone_details_schema_options"
require_relative "types/phone_numbers_get_response"
require "async"

module Pinnacle
  class PhoneNumbersClient
    # @return [Pinnacle::RequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::RequestClient]
    # @return [Pinnacle::PhoneNumbersClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Search for available phone numbers that match your exact criteria.
    #
    # @param features [Array<Pinnacle::Types::PhoneFeatureEnum>]
    # @param location [Hash] Filter your search by geographic location to find numbers in specific regions.
    #  <br>
    #  Toll-free numbers ignore city and state filters.Request of type Pinnacle::PhoneNumbers::Types::SearchSchemaLocation, as a Hash
    #   * :city (String)
    #   * :country_code (String)
    #   * :national_destination_code (String)
    #   * :state (String)
    # @param phone_number_digit_filters [Hash] Filter your search by digit pattern.Request of type Pinnacle::PhoneNumbers::Types::SearchSchemaNumber, as a Hash
    #   * :contains (String)
    #   * :ends_with (String)
    #   * :starts_with (String)
    # @param options [Hash] Extra search settings to control how many results you get.Request of type Pinnacle::PhoneNumbers::Types::SearchSchemaOptions, as a Hash
    #   * :limit (Integer)
    # @param type [Array<Pinnacle::Types::PhoneEnum>] Types of phone numbers to return in your search.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Array<Pinnacle::Types::PhoneNumberDetails>]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.phone_numbers.search(
    #    features: [SMS, MMS],
    #    location: { city: "New York", national_destination_code: "212" },
    #    phone_number_digit_filters: { contains: "514", starts_with: "45" },
    #    options: { limit: 4 },
    #    type: [LOCAL]
    #  )
    def search(type:, features: nil, location: nil, phone_number_digit_filters: nil, options: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          features: features,
          location: location,
          number: phone_number_digit_filters,
          options: options,
          type: type
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/phone-numbers/search"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        Pinnacle::Types::PhoneNumberDetails.from_json(json_object: item)
      end
    end

    # Purchase one or more phone numbers found through the [search
    #  endpoint](./search). <br>
    #  Billing uses your account credits and the numbers are ready for immediate use.
    #
    # @param numbers [Array<String>] List of phone numbers you want to purchase, each in international E.164 format.
    #  <br>
    #  All specified numbers must be currently available and will be validated for
    #  availability before processing the purchase. <br>
    #  If any number in the request is unavailable or invalid, no purchases will be
    #  made and the request will be voided.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Array<Pinnacle::Types::PurchasedNumber>]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.phone_numbers.buy(numbers: ["+18559491727"])
    def buy(numbers:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = { **(request_options&.additional_body_parameters || {}), numbers: numbers }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/phone-numbers/buy"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        Pinnacle::Types::PurchasedNumber.from_json(json_object: item)
      end
    end

    # Retrieve information about any phone number.
    #
    # @param phone [String] Phone number you want to analyze in E.164 format.
    # @param level [Pinnacle::PhoneNumbers::Types::PhoneDetailsSchemaLevel] Choose how much detail you want in your results:
    #  - `basic`: Receive essential info like carrier, location, and format.
    #  - `advanced`: Receive a deeper analysis including fraud risk, detailed location,
    #  and enhanced contact info.
    # @param options [Hash] Customize your lookup with additional options.Request of type Pinnacle::PhoneNumbers::Types::PhoneDetailsSchemaOptions, as a Hash
    #   * :force (Boolean)
    #   * :risk (Boolean)
    #   * :enhanced_contact_info (Hash)
    #     * :context (String)
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::BasicPhoneInformation, Pinnacle::Types::AdvancedPhoneInformation]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.phone_numbers.get(
    #    phone: "+11234567890",
    #    level: ADVANCED,
    #    options: { risk: true, enhanced_contact_info: { context: "This is my friend from JZ. He has done a lot in the crypto space." } }
    #  )
    def get(phone:, level:, options: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          phone: phone,
          level: level,
          options: options
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/phone-numbers/details"
      end
      Pinnacle::PhoneNumbers::Types::PhoneNumbersGetResponse.from_json(json_object: response.body)
    end
  end

  class AsyncPhoneNumbersClient
    # @return [Pinnacle::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Pinnacle::AsyncRequestClient]
    # @return [Pinnacle::AsyncPhoneNumbersClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Search for available phone numbers that match your exact criteria.
    #
    # @param features [Array<Pinnacle::Types::PhoneFeatureEnum>]
    # @param location [Hash] Filter your search by geographic location to find numbers in specific regions.
    #  <br>
    #  Toll-free numbers ignore city and state filters.Request of type Pinnacle::PhoneNumbers::Types::SearchSchemaLocation, as a Hash
    #   * :city (String)
    #   * :country_code (String)
    #   * :national_destination_code (String)
    #   * :state (String)
    # @param phone_number_digit_filters [Hash] Filter your search by digit pattern.Request of type Pinnacle::PhoneNumbers::Types::SearchSchemaNumber, as a Hash
    #   * :contains (String)
    #   * :ends_with (String)
    #   * :starts_with (String)
    # @param options [Hash] Extra search settings to control how many results you get.Request of type Pinnacle::PhoneNumbers::Types::SearchSchemaOptions, as a Hash
    #   * :limit (Integer)
    # @param type [Array<Pinnacle::Types::PhoneEnum>] Types of phone numbers to return in your search.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Array<Pinnacle::Types::PhoneNumberDetails>]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.phone_numbers.search(
    #    features: [SMS, MMS],
    #    location: { city: "New York", national_destination_code: "212" },
    #    phone_number_digit_filters: { contains: "514", starts_with: "45" },
    #    options: { limit: 4 },
    #    type: [LOCAL]
    #  )
    def search(type:, features: nil, location: nil, phone_number_digit_filters: nil, options: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            features: features,
            location: location,
            number: phone_number_digit_filters,
            options: options,
            type: type
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/phone-numbers/search"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          Pinnacle::Types::PhoneNumberDetails.from_json(json_object: item)
        end
      end
    end

    # Purchase one or more phone numbers found through the [search
    #  endpoint](./search). <br>
    #  Billing uses your account credits and the numbers are ready for immediate use.
    #
    # @param numbers [Array<String>] List of phone numbers you want to purchase, each in international E.164 format.
    #  <br>
    #  All specified numbers must be currently available and will be validated for
    #  availability before processing the purchase. <br>
    #  If any number in the request is unavailable or invalid, no purchases will be
    #  made and the request will be voided.
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Array<Pinnacle::Types::PurchasedNumber>]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.phone_numbers.buy(numbers: ["+18559491727"])
    def buy(numbers:, request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.body = { **(request_options&.additional_body_parameters || {}), numbers: numbers }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/phone-numbers/buy"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          Pinnacle::Types::PurchasedNumber.from_json(json_object: item)
        end
      end
    end

    # Retrieve information about any phone number.
    #
    # @param phone [String] Phone number you want to analyze in E.164 format.
    # @param level [Pinnacle::PhoneNumbers::Types::PhoneDetailsSchemaLevel] Choose how much detail you want in your results:
    #  - `basic`: Receive essential info like carrier, location, and format.
    #  - `advanced`: Receive a deeper analysis including fraud risk, detailed location,
    #  and enhanced contact info.
    # @param options [Hash] Customize your lookup with additional options.Request of type Pinnacle::PhoneNumbers::Types::PhoneDetailsSchemaOptions, as a Hash
    #   * :force (Boolean)
    #   * :risk (Boolean)
    #   * :enhanced_contact_info (Hash)
    #     * :context (String)
    # @param request_options [Pinnacle::RequestOptions]
    # @return [Pinnacle::Types::BasicPhoneInformation, Pinnacle::Types::AdvancedPhoneInformation]
    # @example
    #  api = Pinnacle::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Pinnacle::Environment::DEFAULT,
    #    api_key: "YOUR_API_KEY"
    #  )
    #  api.phone_numbers.get(
    #    phone: "+11234567890",
    #    level: ADVANCED,
    #    options: { risk: true, enhanced_contact_info: { context: "This is my friend from JZ. He has done a lot in the crypto space." } }
    #  )
    def get(phone:, level:, options: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["PINNACLE-API-KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            phone: phone,
            level: level,
            options: options
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/phone-numbers/details"
        end
        Pinnacle::PhoneNumbers::Types::PhoneNumbersGetResponse.from_json(json_object: response.body)
      end
    end
  end
end
