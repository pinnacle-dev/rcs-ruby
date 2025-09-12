# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Coordinates provide the precise latitude and longitude values for the phone
    #  number’s registered location.
    class AdvancedPhoneInformationLocationCoordinates
      # @return [Float] Decimal degrees latitude coordinate.
      attr_reader :latitude
      # @return [Float] Decimal degrees longitude coordinate.
      attr_reader :longitude
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param latitude [Float] Decimal degrees latitude coordinate.
      # @param longitude [Float] Decimal degrees longitude coordinate.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::AdvancedPhoneInformationLocationCoordinates]
      def initialize(latitude: OMIT, longitude: OMIT, additional_properties: nil)
        @latitude = latitude if latitude != OMIT
        @longitude = longitude if longitude != OMIT
        @additional_properties = additional_properties
        @_field_set = { "latitude": latitude, "longitude": longitude }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of
      #  AdvancedPhoneInformationLocationCoordinates
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::AdvancedPhoneInformationLocationCoordinates]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        latitude = parsed_json["latitude"]
        longitude = parsed_json["longitude"]
        new(
          latitude: latitude,
          longitude: longitude,
          additional_properties: struct
        )
      end

      # Serialize an instance of AdvancedPhoneInformationLocationCoordinates to a JSON
      #  object
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
        obj.latitude&.is_a?(Float) != false || raise("Passed value for field obj.latitude is not the expected type, validation failed.")
        obj.longitude&.is_a?(Float) != false || raise("Passed value for field obj.longitude is not the expected type, validation failed.")
      end
    end
  end
end
