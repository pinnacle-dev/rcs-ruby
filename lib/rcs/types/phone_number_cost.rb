# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Pricing details for the phone number.
    class PhoneNumberCost
      # @return [Float] Recurring monthly fee covering number ownership and basic services.
      attr_reader :monthly
      # @return [Float] One-time activation or setup fee charged at purchase.
      attr_reader :upfront
      # @return [String] Three-letter currency code for all pricing values.
      attr_reader :currency
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param monthly [Float] Recurring monthly fee covering number ownership and basic services.
      # @param upfront [Float] One-time activation or setup fee charged at purchase.
      # @param currency [String] Three-letter currency code for all pricing values.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::PhoneNumberCost]
      def initialize(monthly:, upfront:, currency:, additional_properties: nil)
        @monthly = monthly
        @upfront = upfront
        @currency = currency
        @additional_properties = additional_properties
        @_field_set = { "monthly": monthly, "upfront": upfront, "currency": currency }
      end

      # Deserialize a JSON object to an instance of PhoneNumberCost
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::PhoneNumberCost]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        monthly = parsed_json["monthly"]
        upfront = parsed_json["upfront"]
        currency = parsed_json["currency"]
        new(
          monthly: monthly,
          upfront: upfront,
          currency: currency,
          additional_properties: struct
        )
      end

      # Serialize an instance of PhoneNumberCost to a JSON object
      #
      # @return [String]
      def to_json(*_args)
        @_field_set&.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.monthly.is_a?(Float) != false || raise("Passed value for field obj.monthly is not the expected type, validation failed.")
        obj.upfront.is_a?(Float) != false || raise("Passed value for field obj.upfront is not the expected type, validation failed.")
        obj.currency.is_a?(String) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      end
    end
  end
end
