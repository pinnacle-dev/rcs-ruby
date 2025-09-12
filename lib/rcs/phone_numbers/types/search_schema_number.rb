# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class PhoneNumbers
    # Filter your search by digit pattern.
    class SearchSchemaNumber
      # @return [String] Your search will return only numbers that contain this digit sequence anywhere
      #  within them.
      attr_reader :contains
      # @return [String] Your search will return only numbers that end with these digits.
      attr_reader :ends_with
      # @return [String] Your search will return only numbers that begin with these digits.
      attr_reader :starts_with
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param contains [String] Your search will return only numbers that contain this digit sequence anywhere
      #  within them.
      # @param ends_with [String] Your search will return only numbers that end with these digits.
      # @param starts_with [String] Your search will return only numbers that begin with these digits.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::PhoneNumbers::SearchSchemaNumber]
      def initialize(contains: OMIT, ends_with: OMIT, starts_with: OMIT, additional_properties: nil)
        @contains = contains if contains != OMIT
        @ends_with = ends_with if ends_with != OMIT
        @starts_with = starts_with if starts_with != OMIT
        @additional_properties = additional_properties
        @_field_set = { "contains": contains, "endsWith": ends_with, "startsWith": starts_with }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of SearchSchemaNumber
      #
      # @param json_object [String]
      # @return [Pinnacle::PhoneNumbers::SearchSchemaNumber]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        contains = parsed_json["contains"]
        ends_with = parsed_json["endsWith"]
        starts_with = parsed_json["startsWith"]
        new(
          contains: contains,
          ends_with: ends_with,
          starts_with: starts_with,
          additional_properties: struct
        )
      end

      # Serialize an instance of SearchSchemaNumber to a JSON object
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
        obj.contains&.is_a?(String) != false || raise("Passed value for field obj.contains is not the expected type, validation failed.")
        obj.ends_with&.is_a?(String) != false || raise("Passed value for field obj.ends_with is not the expected type, validation failed.")
        obj.starts_with&.is_a?(String) != false || raise("Passed value for field obj.starts_with is not the expected type, validation failed.")
      end
    end
  end
end
