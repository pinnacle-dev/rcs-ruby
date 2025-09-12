# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Organization or company information.
    class VCardOrganization
      # @return [String] Company or organization name.
      attr_reader :name
      # @return [Array<String>] Department or organizational units.
      attr_reader :units
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param name [String] Company or organization name.
      # @param units [Array<String>] Department or organizational units.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::VCardOrganization]
      def initialize(name: OMIT, units: OMIT, additional_properties: nil)
        @name = name if name != OMIT
        @units = units if units != OMIT
        @additional_properties = additional_properties
        @_field_set = { "name": name, "units": units }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of VCardOrganization
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::VCardOrganization]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = parsed_json["name"]
        units = parsed_json["units"]
        new(
          name: name,
          units: units,
          additional_properties: struct
        )
      end

      # Serialize an instance of VCardOrganization to a JSON object
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
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.units&.is_a?(Array) != false || raise("Passed value for field obj.units is not the expected type, validation failed.")
      end
    end
  end
end
