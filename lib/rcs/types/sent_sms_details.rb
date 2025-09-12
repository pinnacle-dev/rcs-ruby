# frozen_string_literal: true

require_relative "send_sms_response_segments"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class SentSmsDetails
      # @return [Integer] Unique identifier for the sent message.
      attr_reader :message_id
      # @return [Pinnacle::Types::SendSmsResponseSegments] Details about how the message was segmented for sending.
      attr_reader :segments
      # @return [Float] Total cost of sending the message.
      attr_reader :total_cost
      # @return [String] Sender's phone number in E.164 format.
      attr_reader :sender
      # @return [String] Recipient's phone number in E.164 format.
      attr_reader :recipient
      # @return [String] Message is queued for delivery.
      attr_reader :status
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param message_id [Integer] Unique identifier for the sent message.
      # @param segments [Pinnacle::Types::SendSmsResponseSegments] Details about how the message was segmented for sending.
      # @param total_cost [Float] Total cost of sending the message.
      # @param sender [String] Sender's phone number in E.164 format.
      # @param recipient [String] Recipient's phone number in E.164 format.
      # @param status [String] Message is queued for delivery.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::SentSmsDetails]
      def initialize(message_id:, segments:, total_cost:, sender:, recipient:, status:, additional_properties: nil)
        @message_id = message_id
        @segments = segments
        @total_cost = total_cost
        @sender = sender
        @recipient = recipient
        @status = status
        @additional_properties = additional_properties
        @_field_set = {
          "messageId": message_id,
          "segments": segments,
          "totalCost": total_cost,
          "sender": sender,
          "recipient": recipient,
          "status": status
        }
      end

      # Deserialize a JSON object to an instance of SentSmsDetails
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::SentSmsDetails]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        message_id = parsed_json["messageId"]
        if parsed_json["segments"].nil?
          segments = nil
        else
          segments = parsed_json["segments"].to_json
          segments = Pinnacle::Types::SendSmsResponseSegments.from_json(json_object: segments)
        end
        total_cost = parsed_json["totalCost"]
        sender = parsed_json["sender"]
        recipient = parsed_json["recipient"]
        status = parsed_json["status"]
        new(
          message_id: message_id,
          segments: segments,
          total_cost: total_cost,
          sender: sender,
          recipient: recipient,
          status: status,
          additional_properties: struct
        )
      end

      # Serialize an instance of SentSmsDetails to a JSON object
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
        Pinnacle::Types::SendSmsResponseSegments.validate_raw(obj: obj.segments)
        obj.total_cost.is_a?(Float) != false || raise("Passed value for field obj.total_cost is not the expected type, validation failed.")
        obj.sender.is_a?(String) != false || raise("Passed value for field obj.sender is not the expected type, validation failed.")
        obj.recipient.is_a?(String) != false || raise("Passed value for field obj.recipient is not the expected type, validation failed.")
        obj.status.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      end
    end
  end
end
