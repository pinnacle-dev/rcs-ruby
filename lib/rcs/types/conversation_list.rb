# frozen_string_literal: true

require "json"
require_relative "error_response"
require_relative "retrieved_conversations"

module Pinnacle
  module Types
    # Response for list conversation.
    class ConversationList
      # Deserialize a JSON object to an instance of ConversationList
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::ConversationList]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Pinnacle::Types::ErrorResponse.validate_raw(obj: struct)
          return Pinnacle::Types::ErrorResponse.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::RetrievedConversations.validate_raw(obj: struct)
          return Pinnacle::Types::RetrievedConversations.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        struct
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        begin
          return Pinnacle::Types::ErrorResponse.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::RetrievedConversations.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
