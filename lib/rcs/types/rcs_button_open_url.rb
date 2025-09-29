# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Button that opens a URL when tapped by the recipient.
    class RcsButtonOpenUrl
      # @return [String] Optional additional data to attach to this button.
      attr_reader :metadata
      # @return [String] The URL to open when the button is tapped. Must be a valid HTTP or HTTPS URL.
      attr_reader :payload
      # @return [String] Display text for the button.
      attr_reader :title
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param metadata [String] Optional additional data to attach to this button.
      # @param payload [String] The URL to open when the button is tapped. Must be a valid HTTP or HTTPS URL.
      # @param title [String] Display text for the button.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RcsButtonOpenUrl]
      def initialize(payload:, title:, metadata: OMIT, additional_properties: nil)
        @metadata = metadata if metadata != OMIT
        @payload = payload
        @title = title
        @additional_properties = additional_properties
        @_field_set = { "metadata": metadata, "payload": payload, "title": title }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RcsButtonOpenUrl
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RcsButtonOpenUrl]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        metadata = parsed_json["metadata"]
        payload = parsed_json["payload"]
        title = parsed_json["title"]
        new(
          metadata: metadata,
          payload: payload,
          title: title,
          additional_properties: struct
        )
      end

      # Serialize an instance of RcsButtonOpenUrl to a JSON object
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
        obj.metadata&.is_a?(String) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
        obj.payload.is_a?(String) != false || raise("Passed value for field obj.payload is not the expected type, validation failed.")
        obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      end
    end
  end
end
