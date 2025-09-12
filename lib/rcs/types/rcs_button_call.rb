# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Button that initiates a phone call when tapped by the recipient.
    class RcsButtonCall
      # @return [String] Phone number to call in E.164 format
      attr_reader :payload
      # @return [String] Display text for the button.
      attr_reader :title
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param payload [String] Phone number to call in E.164 format
      # @param title [String] Display text for the button.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RcsButtonCall]
      def initialize(payload:, title:, additional_properties: nil)
        @payload = payload
        @title = title
        @additional_properties = additional_properties
        @_field_set = { "payload": payload, "title": title }
      end

      # Deserialize a JSON object to an instance of RcsButtonCall
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RcsButtonCall]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        payload = parsed_json["payload"]
        title = parsed_json["title"]
        new(
          payload: payload,
          title: title,
          additional_properties: struct
        )
      end

      # Serialize an instance of RcsButtonCall to a JSON object
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
        obj.payload.is_a?(String) != false || raise("Passed value for field obj.payload is not the expected type, validation failed.")
        obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      end
    end
  end
end
