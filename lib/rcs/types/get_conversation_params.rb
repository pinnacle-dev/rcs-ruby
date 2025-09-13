# frozen_string_literal: true

require "json"
require_relative "conversation_by_id_params"
require_relative "conversation_by_participants_params"

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
          Pinnacle::Types::ConversationByIdParams.validate_raw(obj: struct)
          return Pinnacle::Types::ConversationByIdParams.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::ConversationByParticipantsParams.validate_raw(obj: struct)
          return Pinnacle::Types::ConversationByParticipantsParams.from_json(json_object: struct) unless struct.nil?

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
          return Pinnacle::Types::ConversationByIdParams.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::ConversationByParticipantsParams.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
