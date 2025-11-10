# frozen_string_literal: true

require_relative "message_with_reaction"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Paginated list of messages in a conversation.
    class MessageList
      # @return [Array<Pinnacle::Types::MessageWithReaction>] Array of messages in the conversation.
      attr_reader :messages
      # @return [Boolean] Indicates if more messages are available beyond the current page.
      attr_reader :has_more
      # @return [Integer] Total number of messages in the conversation.
      attr_reader :count
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param messages [Array<Pinnacle::Types::MessageWithReaction>] Array of messages in the conversation.
      # @param has_more [Boolean] Indicates if more messages are available beyond the current page.
      # @param count [Integer] Total number of messages in the conversation.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::MessageList]
      def initialize(messages:, has_more:, count:, additional_properties: nil)
        @messages = messages
        @has_more = has_more
        @count = count
        @additional_properties = additional_properties
        @_field_set = { "messages": messages, "hasMore": has_more, "count": count }
      end

      # Deserialize a JSON object to an instance of MessageList
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::MessageList]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        messages = parsed_json["messages"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::MessageWithReaction.from_json(json_object: item)
        end
        has_more = parsed_json["hasMore"]
        count = parsed_json["count"]
        new(
          messages: messages,
          has_more: has_more,
          count: count,
          additional_properties: struct
        )
      end

      # Serialize an instance of MessageList to a JSON object
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
        obj.messages.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
        obj.has_more.is_a?(Boolean) != false || raise("Passed value for field obj.has_more is not the expected type, validation failed.")
        obj.count.is_a?(Integer) != false || raise("Passed value for field obj.count is not the expected type, validation failed.")
      end
    end
  end
end
