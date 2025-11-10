# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # SMS message containing plain text only.
    class MessageEventSmsContent
      # @return [String] Message type identifier.
      attr_reader :type
      # @return [String] Unique identifier of the message. This identifier is a string that always begins
      #  with the prefix `msg_`, for example: `msg_1234567890`. <br><br>
      #  To get the message details, use the [GET
      #  /messages/{id}](/api-reference/messages/get) endpoint.
      attr_reader :id
      # @return [String] Message content.
      attr_reader :text
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param type [String] Message type identifier.
      # @param id [String] Unique identifier of the message. This identifier is a string that always begins
      #  with the prefix `msg_`, for example: `msg_1234567890`. <br><br>
      #  To get the message details, use the [GET
      #  /messages/{id}](/api-reference/messages/get) endpoint.
      # @param text [String] Message content.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::MessageEventSmsContent]
      def initialize(type:, id:, text:, additional_properties: nil)
        @type = type
        @id = id
        @text = text
        @additional_properties = additional_properties
        @_field_set = { "type": type, "id": id, "text": text }
      end

      # Deserialize a JSON object to an instance of MessageEventSmsContent
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::MessageEventSmsContent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        type = parsed_json["type"]
        id = parsed_json["id"]
        text = parsed_json["text"]
        new(
          type: type,
          id: id,
          text: text,
          additional_properties: struct
        )
      end

      # Serialize an instance of MessageEventSmsContent to a JSON object
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
        obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      end
    end
  end
end
