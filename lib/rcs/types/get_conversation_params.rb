# frozen_string_literal: true

require "json"
require_relative "get_conversation_request_id"
require_relative "get_conversation_request_recipient"

module Pinnacle
  module Types
    # Parameters for getting a specific conversation.
    class GetConversationParams
      # Deserialize a JSON object to an instance of GetConversationParams
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::GetConversationParams]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Pinnacle::Types::GetConversationRequestId.validate_raw(obj: struct)
          return Pinnacle::Types::GetConversationRequestId.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::GetConversationRequestRecipient.validate_raw(obj: struct)
          return Pinnacle::Types::GetConversationRequestRecipient.from_json(json_object: struct) unless struct.nil?

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
          return Pinnacle::Types::GetConversationRequestId.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::GetConversationRequestRecipient.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
