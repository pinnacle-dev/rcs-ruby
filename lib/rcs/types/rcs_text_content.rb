# frozen_string_literal: true

require_relative "rich_button"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Message containing longer text content with optional quick reply buttons.
    class RcsTextContent
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

      # @param quick_replies [Array<Pinnacle::Types::RichButton>] List of interactive quick reply buttons in the message.
      # @param text [String] Text content of the RCS message.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RcsTextContent]
      def initialize(quick_replies:, text:, additional_properties: nil)
        @quick_replies = quick_replies
        @text = text
        @additional_properties = additional_properties
        @_field_set = { "quickReplies": quick_replies, "text": text }
      end

      # Deserialize a JSON object to an instance of RcsTextContent
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RcsTextContent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        quick_replies = parsed_json["quickReplies"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::RichButton.from_json(json_object: item)
        end
        text = parsed_json["text"]
        new(
          quick_replies: quick_replies,
          text: text,
          additional_properties: struct
        )
      end

      # Serialize an instance of RcsTextContent to a JSON object
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
        obj.quick_replies.is_a?(Array) != false || raise("Passed value for field obj.quick_replies is not the expected type, validation failed.")
        obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      end
    end
  end
end
