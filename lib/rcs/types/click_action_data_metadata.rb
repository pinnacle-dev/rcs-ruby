# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Data that is attached to the button. <br>
    #  This is only returned when `trigger` buttons are pressed.
    class ClickActionDataMetadata
      # @return [String] Additional metadata attached to the interaction.
      attr_reader :metadata
      # @return [String] Payload associated with the button.
      attr_reader :payload
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param metadata [String] Additional metadata attached to the interaction.
      # @param payload [String] Payload associated with the button.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::ClickActionDataMetadata]
      def initialize(metadata:, payload:, additional_properties: nil)
        @metadata = metadata
        @payload = payload
        @additional_properties = additional_properties
        @_field_set = { "metadata": metadata, "payload": payload }
      end

      # Deserialize a JSON object to an instance of ClickActionDataMetadata
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::ClickActionDataMetadata]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        metadata = parsed_json["metadata"]
        payload = parsed_json["payload"]
        new(
          metadata: metadata,
          payload: payload,
          additional_properties: struct
        )
      end

      # Serialize an instance of ClickActionDataMetadata to a JSON object
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
        obj.metadata.is_a?(String) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
        obj.payload.is_a?(String) != false || raise("Passed value for field obj.payload is not the expected type, validation failed.")
      end
    end
  end
end
