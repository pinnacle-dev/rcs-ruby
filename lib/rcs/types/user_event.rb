# frozen_string_literal: true

require_relative "user_event_conversation"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Represents an event triggered by a user such as when they start typing.
    class UserEvent
      # @return [String] Type of user event.
      attr_reader :type
      # @return [String] Timestamp when the user event started in ISO 8601 format.
      attr_reader :started_at
      # @return [Pinnacle::Types::UserEventConversation] Conversation metadata containing the conversation ID, sender, and recipient
      #  information.
      attr_reader :conversation
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param type [String] Type of user event.
      # @param started_at [String] Timestamp when the user event started in ISO 8601 format.
      # @param conversation [Pinnacle::Types::UserEventConversation] Conversation metadata containing the conversation ID, sender, and recipient
      #  information.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::UserEvent]
      def initialize(type:, started_at:, conversation:, additional_properties: nil)
        @type = type
        @started_at = started_at
        @conversation = conversation
        @additional_properties = additional_properties
        @_field_set = { "type": type, "startedAt": started_at, "conversation": conversation }
      end

      # Deserialize a JSON object to an instance of UserEvent
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::UserEvent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        type = parsed_json["type"]
        started_at = parsed_json["startedAt"]
        if parsed_json["conversation"].nil?
          conversation = nil
        else
          conversation = parsed_json["conversation"].to_json
          conversation = Pinnacle::Types::UserEventConversation.from_json(json_object: conversation)
        end
        new(
          type: type,
          started_at: started_at,
          conversation: conversation,
          additional_properties: struct
        )
      end

      # Serialize an instance of UserEvent to a JSON object
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
        obj.started_at.is_a?(String) != false || raise("Passed value for field obj.started_at is not the expected type, validation failed.")
        Pinnacle::Types::UserEventConversation.validate_raw(obj: obj.conversation)
      end
    end
  end
end
