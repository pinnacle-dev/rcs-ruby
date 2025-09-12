# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Geographic and routing information for the phone number.
    class PhoneNumberRegion
      # @return [String] Two-letter country code where the number is registered.
      attr_reader :country
      # @return [String] State or province code applicable to local numbers.
      attr_reader :state
      # @return [String] Primary city or metropolitan area served by the number.
      attr_reader :city
      # @return [String] Telecommunications rate center used for call routing and billing,
      #  defining local calling area boundaries.
      attr_reader :rate_center
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param country [String] Two-letter country code where the number is registered.
      # @param state [String] State or province code applicable to local numbers.
      # @param city [String] Primary city or metropolitan area served by the number.
      # @param rate_center [String] Telecommunications rate center used for call routing and billing,
      #  defining local calling area boundaries.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::PhoneNumberRegion]
      def initialize(country:, state: OMIT, city: OMIT, rate_center: OMIT, additional_properties: nil)
        @country = country
        @state = state if state != OMIT
        @city = city if city != OMIT
        @rate_center = rate_center if rate_center != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "country": country,
          "state": state,
          "city": city,
          "rateCenter": rate_center
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of PhoneNumberRegion
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::PhoneNumberRegion]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        country = parsed_json["country"]
        state = parsed_json["state"]
        city = parsed_json["city"]
        rate_center = parsed_json["rateCenter"]
        new(
          country: country,
          state: state,
          city: city,
          rate_center: rate_center,
          additional_properties: struct
        )
      end

      # Serialize an instance of PhoneNumberRegion to a JSON object
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
        obj.country.is_a?(String) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
        obj.state&.is_a?(String) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
        obj.city&.is_a?(String) != false || raise("Passed value for field obj.city is not the expected type, validation failed.")
        obj.rate_center&.is_a?(String) != false || raise("Passed value for field obj.rate_center is not the expected type, validation failed.")
      end
    end
  end
end
