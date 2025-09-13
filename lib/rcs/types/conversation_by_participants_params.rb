# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Retrieve conversation information by sender and recipient.
    class ConversationByParticipantsParams
      # @return [String] The recipient's phone number in E.164 format
      attr_reader :recipient
      # @return [String] The sender identifier. Can be either:
      #  - A phone number in E.164 format
      #  - An RCS agent ID prefixed with 'agent_'
      attr_reader :sender
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param recipient [String] The recipient's phone number in E.164 format
      # @param sender [String] The sender identifier. Can be either:
      #  - A phone number in E.164 format
      #  - An RCS agent ID prefixed with 'agent_'
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::ConversationByParticipantsParams]
      def initialize(recipient:, sender:, additional_properties: nil)
        @recipient = recipient
        @sender = sender
        @additional_properties = additional_properties
        @_field_set = { "recipient": recipient, "sender": sender }
      end

      # Deserialize a JSON object to an instance of ConversationByParticipantsParams
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::ConversationByParticipantsParams]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        recipient = parsed_json["recipient"]
        sender = parsed_json["sender"]
        new(
          recipient: recipient,
          sender: sender,
          additional_properties: struct
        )
      end

      # Serialize an instance of ConversationByParticipantsParams to a JSON object
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
        obj.recipient.is_a?(String) != false || raise("Passed value for field obj.recipient is not the expected type, validation failed.")
        obj.sender.is_a?(String) != false || raise("Passed value for field obj.sender is not the expected type, validation failed.")
      end
    end
  end
end
