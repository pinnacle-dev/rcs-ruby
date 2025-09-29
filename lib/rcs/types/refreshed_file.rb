# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    class RefreshedFile
      # @return [String] The original file URI that was provided in the request.
      attr_reader :original
      # @return [String] The new refreshed presigned URL that expires in one hour.
      attr_reader :refreshed
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param original [String] The original file URI that was provided in the request.
      # @param refreshed [String] The new refreshed presigned URL that expires in one hour.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RefreshedFile]
      def initialize(original:, refreshed:, additional_properties: nil)
        @original = original
        @refreshed = refreshed
        @additional_properties = additional_properties
        @_field_set = { "original": original, "refreshed": refreshed }
      end

      # Deserialize a JSON object to an instance of RefreshedFile
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RefreshedFile]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        original = parsed_json["original"]
        refreshed = parsed_json["refreshed"]
        new(
          original: original,
          refreshed: refreshed,
          additional_properties: struct
        )
      end

      # Serialize an instance of RefreshedFile to a JSON object
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
        obj.original.is_a?(String) != false || raise("Passed value for field obj.original is not the expected type, validation failed.")
        obj.refreshed.is_a?(String) != false || raise("Passed value for field obj.refreshed is not the expected type, validation failed.")
      end
    end
  end
end
