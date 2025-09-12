# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class Brands
    class AutofillBrandSchemaOptions
      # @return [Boolean] Set to true to bypass cached data and fetch fresh information.
      attr_reader :force_reload
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param force_reload [Boolean] Set to true to bypass cached data and fetch fresh information.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Brands::AutofillBrandSchemaOptions]
      def initialize(force_reload: OMIT, additional_properties: nil)
        @force_reload = force_reload if force_reload != OMIT
        @additional_properties = additional_properties
        @_field_set = { "forceReload": force_reload }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AutofillBrandSchemaOptions
      #
      # @param json_object [String]
      # @return [Pinnacle::Brands::AutofillBrandSchemaOptions]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        force_reload = parsed_json["forceReload"]
        new(force_reload: force_reload, additional_properties: struct)
      end

      # Serialize an instance of AutofillBrandSchemaOptions to a JSON object
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
        obj.force_reload&.is_a?(Boolean) != false || raise("Passed value for field obj.force_reload is not the expected type, validation failed.")
      end
    end
  end
end
