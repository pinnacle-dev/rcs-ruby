# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Contact information linked to the phone number registration, if available.
    class BasicPhoneInformationContact
      # @return [String] Registered name associated with the phone number.
      attr_reader :name
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param name [String] Registered name associated with the phone number.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::BasicPhoneInformationContact]
      def initialize(name:, additional_properties: nil)
        @name = name
        @additional_properties = additional_properties
        @_field_set = { "name": name }
      end

      # Deserialize a JSON object to an instance of BasicPhoneInformationContact
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::BasicPhoneInformationContact]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = parsed_json["name"]
        new(name: name, additional_properties: struct)
      end

      # Serialize an instance of BasicPhoneInformationContact to a JSON object
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
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      end
    end
  end
end
