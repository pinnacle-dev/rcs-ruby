# frozen_string_literal: true

require_relative "rich_button"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # RCS message containing longer text content with optional quick reply buttons.
    class MessageEventRcsTextContent
      # @return [String] Message type identifier.
      attr_reader :type
      # @return [String] Unique identifier of the message. This identifier is a string that always begins
      #  with the prefix `msg_`, for example: `msg_1234567890`. <br><br>
      #  To get the message details, use the [GET
      #  /messages/{id}](/api-reference/messages/get) endpoint.
      attr_reader :id
      # @return [Array<Pinnacle::Types::RichButton>] List of interactive quick reply buttons in the message.
      attr_reader :quick_replies
      # @return [String] Text content of the RCS message.
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
      # @param quick_replies [Array<Pinnacle::Types::RichButton>] List of interactive quick reply buttons in the message.
      # @param text [String] Text content of the RCS message.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::MessageEventRcsTextContent]
      def initialize(type:, id:, quick_replies:, text:, additional_properties: nil)
        @type = type
        @id = id
        @quick_replies = quick_replies
        @text = text
        @additional_properties = additional_properties
        @_field_set = { "type": type, "id": id, "quickReplies": quick_replies, "text": text }
      end

      # Deserialize a JSON object to an instance of MessageEventRcsTextContent
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::MessageEventRcsTextContent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        type = parsed_json["type"]
        id = parsed_json["id"]
        quick_replies = parsed_json["quickReplies"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::RichButton.from_json(json_object: item)
        end
        text = parsed_json["text"]
        new(
          type: type,
          id: id,
          quick_replies: quick_replies,
          text: text,
          additional_properties: struct
        )
      end

      # Serialize an instance of MessageEventRcsTextContent to a JSON object
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
        obj.quick_replies.is_a?(Array) != false || raise("Passed value for field obj.quick_replies is not the expected type, validation failed.")
        obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      end
    end
  end
end
