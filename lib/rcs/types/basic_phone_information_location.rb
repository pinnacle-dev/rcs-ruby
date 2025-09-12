# frozen_string_literal: true

require_relative "basic_phone_information_location_country"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Geographic and political details where the phone number is registered.
    class BasicPhoneInformationLocation
      # @return [Pinnacle::Types::BasicPhoneInformationLocationCountry] Information about the country of registration.
      attr_reader :country
      # @return [String] Location description including region, state/province, and city.
      attr_reader :place
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param country [Pinnacle::Types::BasicPhoneInformationLocationCountry] Information about the country of registration.
      # @param place [String] Location description including region, state/province, and city.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::BasicPhoneInformationLocation]
      def initialize(country:, place:, additional_properties: nil)
        @country = country
        @place = place
        @additional_properties = additional_properties
        @_field_set = { "country": country, "place": place }
      end

      # Deserialize a JSON object to an instance of BasicPhoneInformationLocation
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::BasicPhoneInformationLocation]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["country"].nil?
          country = nil
        else
          country = parsed_json["country"].to_json
          country = Pinnacle::Types::BasicPhoneInformationLocationCountry.from_json(json_object: country)
        end
        place = parsed_json["place"]
        new(
          country: country,
          place: place,
          additional_properties: struct
        )
      end

      # Serialize an instance of BasicPhoneInformationLocation to a JSON object
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
        Pinnacle::Types::BasicPhoneInformationLocationCountry.validate_raw(obj: obj.country)
        obj.place.is_a?(String) != false || raise("Passed value for field obj.place is not the expected type, validation failed.")
      end
    end
  end
end
