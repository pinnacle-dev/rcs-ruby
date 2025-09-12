# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    class ZodError
      # @return [String] Human-readable summary of validation failures.
      attr_reader :description
      # @return [Hash{String => Object}] Structured dictionary of issues containing two main sections:
      #  - `errors`: Array of global validation errors not tied to specific fields
      #  - `properties`: Object mapping field names to their specific validation errors,
      #  where each field contains an `errors` array
      attr_reader :errors
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param description [String] Human-readable summary of validation failures.
      # @param errors [Hash{String => Object}] Structured dictionary of issues containing two main sections:
      #  - `errors`: Array of global validation errors not tied to specific fields
      #  - `properties`: Object mapping field names to their specific validation errors,
      #  where each field contains an `errors` array
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::ZodError]
      def initialize(description:, errors:, additional_properties: nil)
        @description = description
        @errors = errors
        @additional_properties = additional_properties
        @_field_set = { "description": description, "errors": errors }
      end

      # Deserialize a JSON object to an instance of ZodError
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::ZodError]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        description = parsed_json["description"]
        errors = parsed_json["errors"]
        new(
          description: description,
          errors: errors,
          additional_properties: struct
        )
      end

      # Serialize an instance of ZodError to a JSON object
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
        obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.errors.is_a?(Hash) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      end
    end
  end
end
