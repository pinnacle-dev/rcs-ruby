# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    class ReactionResult
      # @return [Integer] ID of the message.
      attr_reader :message_id
      # @return [Integer] Unique identifier for the reaction.
      attr_reader :reaction_message_id
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param message_id [Integer] ID of the message.
      # @param reaction_message_id [Integer] Unique identifier for the reaction.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::ReactionResult]
      def initialize(message_id:, reaction_message_id:, additional_properties: nil)
        @message_id = message_id
        @reaction_message_id = reaction_message_id
        @additional_properties = additional_properties
        @_field_set = { "messageId": message_id, "reactionMessageId": reaction_message_id }
      end

      # Deserialize a JSON object to an instance of ReactionResult
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::ReactionResult]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        message_id = parsed_json["messageId"]
        reaction_message_id = parsed_json["reactionMessageId"]
        new(
          message_id: message_id,
          reaction_message_id: reaction_message_id,
          additional_properties: struct
        )
      end

      # Serialize an instance of ReactionResult to a JSON object
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
        obj.message_id.is_a?(Integer) != false || raise("Passed value for field obj.message_id is not the expected type, validation failed.")
        obj.reaction_message_id.is_a?(Integer) != false || raise("Passed value for field obj.reaction_message_id is not the expected type, validation failed.")
      end
    end
  end
end
