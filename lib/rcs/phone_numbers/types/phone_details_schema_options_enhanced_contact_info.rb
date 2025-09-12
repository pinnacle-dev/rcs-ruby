# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class PhoneNumbers
    # Additional information to tailor lookup.
    class PhoneDetailsSchemaOptionsEnhancedContactInfo
      # @return [String] Business context.
      attr_reader :context
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param context [String] Business context.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::PhoneNumbers::PhoneDetailsSchemaOptionsEnhancedContactInfo]
      def initialize(context: OMIT, additional_properties: nil)
        @context = context if context != OMIT
        @additional_properties = additional_properties
        @_field_set = { "context": context }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of
      #  PhoneDetailsSchemaOptionsEnhancedContactInfo
      #
      # @param json_object [String]
      # @return [Pinnacle::PhoneNumbers::PhoneDetailsSchemaOptionsEnhancedContactInfo]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        context = parsed_json["context"]
        new(context: context, additional_properties: struct)
      end

      # Serialize an instance of PhoneDetailsSchemaOptionsEnhancedContactInfo to a JSON
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
        obj.context&.is_a?(String) != false || raise("Passed value for field obj.context is not the expected type, validation failed.")
      end
    end
  end
end
