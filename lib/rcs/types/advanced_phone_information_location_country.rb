# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Complete country identification and metadata.
    class AdvancedPhoneInformationLocationCountry
      # @return [String] Name of the country.
      attr_reader :name
      # @return [String] Two-letter country code where the number is registered.
      attr_reader :code
      # @return [String] Three-letter country code where the number is registered.
      attr_reader :code_3
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param name [String] Name of the country.
      # @param code [String] Two-letter country code where the number is registered.
      # @param code_3 [String] Three-letter country code where the number is registered.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::AdvancedPhoneInformationLocationCountry]
      def initialize(name:, code:, code_3:, additional_properties: nil)
        @name = name
        @code = code
        @code_3 = code_3
        @additional_properties = additional_properties
        @_field_set = { "name": name, "code": code, "code3": code_3 }
      end

      # Deserialize a JSON object to an instance of
      #  AdvancedPhoneInformationLocationCountry
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::AdvancedPhoneInformationLocationCountry]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = parsed_json["name"]
        code = parsed_json["code"]
        code_3 = parsed_json["code3"]
        new(
          name: name,
          code: code,
          code_3: code_3,
          additional_properties: struct
        )
      end

      # Serialize an instance of AdvancedPhoneInformationLocationCountry to a JSON
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
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.code.is_a?(String) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
        obj.code_3.is_a?(String) != false || raise("Passed value for field obj.code_3 is not the expected type, validation failed.")
      end
    end
  end
end
