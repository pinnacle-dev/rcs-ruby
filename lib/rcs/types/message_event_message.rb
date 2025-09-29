# frozen_string_literal: true

require_relative "message_content"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Message details including ID and content.
    class MessageEventMessage
      # @return [Integer] Unique identifier of the message. To get the message details, use the [GET
      #  /messages/{id}](/api-reference/messages/get) endpoint.
      attr_reader :id
      # @return [Pinnacle::Types::MessageContent]
      attr_reader :content
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [Integer] Unique identifier of the message. To get the message details, use the [GET
      #  /messages/{id}](/api-reference/messages/get) endpoint.
      # @param content [Pinnacle::Types::MessageContent]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::MessageEventMessage]
      def initialize(id:, content:, additional_properties: nil)
        @id = id
        @content = content
        @additional_properties = additional_properties
        @_field_set = { "id": id, "content": content }
      end

      # Deserialize a JSON object to an instance of MessageEventMessage
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::MessageEventMessage]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        if parsed_json["content"].nil?
          content = nil
        else
          content = parsed_json["content"].to_json
          content = Pinnacle::Types::MessageContent.from_json(json_object: content)
        end
        new(
          id: id,
          content: content,
          additional_properties: struct
        )
      end

      # Serialize an instance of MessageEventMessage to a JSON object
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
        obj.id.is_a?(Integer) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        Pinnacle::Types::MessageContent.validate_raw(obj: obj.content)
      end
    end
  end
end
