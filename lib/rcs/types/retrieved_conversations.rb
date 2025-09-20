# frozen_string_literal: true

require_relative "conversation"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class RetrievedConversations
      # @return [Integer] Total number of conversations matching the filter.
      attr_reader :count
      # @return [Array<Pinnacle::Types::Conversation>]
      attr_reader :conversations
      # @return [Boolean] Indicates if more conversations are available beyond the current page.
      attr_reader :has_more
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param count [Integer] Total number of conversations matching the filter.
      # @param conversations [Array<Pinnacle::Types::Conversation>]
      # @param has_more [Boolean] Indicates if more conversations are available beyond the current page.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RetrievedConversations]
      def initialize(count:, conversations:, has_more:, additional_properties: nil)
        @count = count
        @conversations = conversations
        @has_more = has_more
        @additional_properties = additional_properties
        @_field_set = { "count": count, "conversations": conversations, "hasMore": has_more }
      end

      # Deserialize a JSON object to an instance of RetrievedConversations
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RetrievedConversations]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        count = parsed_json["count"]
        conversations = parsed_json["conversations"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::Conversation.from_json(json_object: item)
        end
        has_more = parsed_json["hasMore"]
        new(
          count: count,
          conversations: conversations,
          has_more: has_more,
          additional_properties: struct
        )
      end

      # Serialize an instance of RetrievedConversations to a JSON object
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
        obj.count.is_a?(Integer) != false || raise("Passed value for field obj.count is not the expected type, validation failed.")
        obj.conversations.is_a?(Array) != false || raise("Passed value for field obj.conversations is not the expected type, validation failed.")
        obj.has_more.is_a?(Boolean) != false || raise("Passed value for field obj.has_more is not the expected type, validation failed.")
      end
    end
  end
end
