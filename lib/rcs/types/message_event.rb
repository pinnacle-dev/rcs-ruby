# frozen_string_literal: true

require_relative "webhook_event_enum"
require_relative "message_event_conversation"
require_relative "message_status_enum"
require_relative "message_event_direction"
require_relative "message_event_content"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Represents an incoming message or message status update received via webhook.
    class MessageEvent
      # @return [Pinnacle::Types::WebhookEventEnum] Type of webhook event. MESSAGE.STATUS for message status updates or
      #  MESSAGE.RECEIVED for inbound messages.
      attr_reader :type
      # @return [Pinnacle::Types::MessageEventConversation] Conversation metadata containing the conversation ID, sender, and recipient
      #  information.
      attr_reader :conversation
      # @return [Pinnacle::Types::MessageStatusEnum]
      attr_reader :status
      # @return [Pinnacle::Types::MessageEventDirection] Direction of the message flow.
      attr_reader :direction
      # @return [Integer] Number of segments for this message.
      attr_reader :segments
      # @return [String] Timestamp when the message was sent in ISO 8601 format.
      attr_reader :sent_at
      # @return [String] Timestamp when the message was delivered in ISO 8601 format.
      #  Null if not yet delivered or for inbound messages.
      attr_reader :delivered_at
      # @return [Pinnacle::Types::MessageEventContent]
      attr_reader :message
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param type [Pinnacle::Types::WebhookEventEnum] Type of webhook event. MESSAGE.STATUS for message status updates or
      #  MESSAGE.RECEIVED for inbound messages.
      # @param conversation [Pinnacle::Types::MessageEventConversation] Conversation metadata containing the conversation ID, sender, and recipient
      #  information.
      # @param status [Pinnacle::Types::MessageStatusEnum]
      # @param direction [Pinnacle::Types::MessageEventDirection] Direction of the message flow.
      # @param segments [Integer] Number of segments for this message.
      # @param sent_at [String] Timestamp when the message was sent in ISO 8601 format.
      # @param delivered_at [String] Timestamp when the message was delivered in ISO 8601 format.
      #  Null if not yet delivered or for inbound messages.
      # @param message [Pinnacle::Types::MessageEventContent]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::MessageEvent]
      def initialize(type:, conversation:, status:, direction:, segments:, sent_at:, message:, delivered_at: OMIT,
                     additional_properties: nil)
        @type = type
        @conversation = conversation
        @status = status
        @direction = direction
        @segments = segments
        @sent_at = sent_at
        @delivered_at = delivered_at if delivered_at != OMIT
        @message = message
        @additional_properties = additional_properties
        @_field_set = {
          "type": type,
          "conversation": conversation,
          "status": status,
          "direction": direction,
          "segments": segments,
          "sentAt": sent_at,
          "deliveredAt": delivered_at,
          "message": message
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of MessageEvent
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::MessageEvent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        type = parsed_json["type"]
        if parsed_json["conversation"].nil?
          conversation = nil
        else
          conversation = parsed_json["conversation"].to_json
          conversation = Pinnacle::Types::MessageEventConversation.from_json(json_object: conversation)
        end
        status = parsed_json["status"]
        direction = parsed_json["direction"]
        segments = parsed_json["segments"]
        sent_at = parsed_json["sentAt"]
        delivered_at = parsed_json["deliveredAt"]
        if parsed_json["message"].nil?
          message = nil
        else
          message = parsed_json["message"].to_json
          message = Pinnacle::Types::MessageEventContent.from_json(json_object: message)
        end
        new(
          type: type,
          conversation: conversation,
          status: status,
          direction: direction,
          segments: segments,
          sent_at: sent_at,
          delivered_at: delivered_at,
          message: message,
          additional_properties: struct
        )
      end

      # Serialize an instance of MessageEvent to a JSON object
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
        obj.type.is_a?(Pinnacle::Types::WebhookEventEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        Pinnacle::Types::MessageEventConversation.validate_raw(obj: obj.conversation)
        obj.status.is_a?(Pinnacle::Types::MessageStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.direction.is_a?(Pinnacle::Types::MessageEventDirection) != false || raise("Passed value for field obj.direction is not the expected type, validation failed.")
        obj.segments.is_a?(Integer) != false || raise("Passed value for field obj.segments is not the expected type, validation failed.")
        obj.sent_at.is_a?(String) != false || raise("Passed value for field obj.sent_at is not the expected type, validation failed.")
        obj.delivered_at&.is_a?(String) != false || raise("Passed value for field obj.delivered_at is not the expected type, validation failed.")
        Pinnacle::Types::MessageEventContent.validate_raw(obj: obj.message)
      end
    end
  end
end
