# frozen_string_literal: true

require_relative "message_content"
require_relative "message_method_enum"
require_relative "message_status_enum"
require_relative "message_protocol_enum"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class Message
      # @return [Pinnacle::Types::MessageContent]
      attr_reader :content
      # @return [Float] Total cost charged for sending the message. <br>
      #  Null means the message incurred no cost or has not been charged yet.
      attr_reader :cost
      # @return [String] Timestamp indicating when the message was successfully delivered to the
      #  recipient. <br>
      #  Null indicates the message has not yet been delivered.
      attr_reader :delivered_at
      # @return [String] Detailed explanation of any errors that occurred while delivering the message.
      #  <br>
      #  Null indicates no errors.
      attr_reader :error
      # @return [String] Unique identifier of the message. This identifier is a string that always begins
      #  with the prefix `msg_`, for example: `msg_1234567890`.
      attr_reader :id
      # @return [Pinnacle::Types::MessageMethodEnum]
      attr_reader :method_
      # @return [Integer] Number of segments the message was split into for delivery.
      attr_reader :num_segments
      # @return [String] Phone number that received the message in E.164 format.
      attr_reader :receiver
      # @return [String] Phone number or agent that sent the message.
      attr_reader :sender
      # @return [String] Timestamp indicating when the message was submitted for delivery. <br>
      #  Null indicates the message is still in the queue.
      attr_reader :sent_at
      # @return [Pinnacle::Types::MessageStatusEnum]
      attr_reader :status
      # @return [Pinnacle::Types::MessageProtocolEnum]
      attr_reader :type
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param content [Pinnacle::Types::MessageContent]
      # @param cost [Float] Total cost charged for sending the message. <br>
      #  Null means the message incurred no cost or has not been charged yet.
      # @param delivered_at [String] Timestamp indicating when the message was successfully delivered to the
      #  recipient. <br>
      #  Null indicates the message has not yet been delivered.
      # @param error [String] Detailed explanation of any errors that occurred while delivering the message.
      #  <br>
      #  Null indicates no errors.
      # @param id [String] Unique identifier of the message. This identifier is a string that always begins
      #  with the prefix `msg_`, for example: `msg_1234567890`.
      # @param method_ [Pinnacle::Types::MessageMethodEnum]
      # @param num_segments [Integer] Number of segments the message was split into for delivery.
      # @param receiver [String] Phone number that received the message in E.164 format.
      # @param sender [String] Phone number or agent that sent the message.
      # @param sent_at [String] Timestamp indicating when the message was submitted for delivery. <br>
      #  Null indicates the message is still in the queue.
      # @param status [Pinnacle::Types::MessageStatusEnum]
      # @param type [Pinnacle::Types::MessageProtocolEnum]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::Message]
      def initialize(content:, id:, method_:, num_segments:, receiver:, sender:, status:, type:, cost: OMIT,
                     delivered_at: OMIT, error: OMIT, sent_at: OMIT, additional_properties: nil)
        @content = content
        @cost = cost if cost != OMIT
        @delivered_at = delivered_at if delivered_at != OMIT
        @error = error if error != OMIT
        @id = id
        @method_ = method_
        @num_segments = num_segments
        @receiver = receiver
        @sender = sender
        @sent_at = sent_at if sent_at != OMIT
        @status = status
        @type = type
        @additional_properties = additional_properties
        @_field_set = {
          "content": content,
          "cost": cost,
          "deliveredAt": delivered_at,
          "error": error,
          "id": id,
          "method": method_,
          "numSegments": num_segments,
          "receiver": receiver,
          "sender": sender,
          "sentAt": sent_at,
          "status": status,
          "type": type
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Message
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::Message]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["content"].nil?
          content = nil
        else
          content = parsed_json["content"].to_json
          content = Pinnacle::Types::MessageContent.from_json(json_object: content)
        end
        cost = parsed_json["cost"]
        delivered_at = parsed_json["deliveredAt"]
        error = parsed_json["error"]
        id = parsed_json["id"]
        method_ = parsed_json["method"]
        num_segments = parsed_json["numSegments"]
        receiver = parsed_json["receiver"]
        sender = parsed_json["sender"]
        sent_at = parsed_json["sentAt"]
        status = parsed_json["status"]
        type = parsed_json["type"]
        new(
          content: content,
          cost: cost,
          delivered_at: delivered_at,
          error: error,
          id: id,
          method_: method_,
          num_segments: num_segments,
          receiver: receiver,
          sender: sender,
          sent_at: sent_at,
          status: status,
          type: type,
          additional_properties: struct
        )
      end

      # Serialize an instance of Message to a JSON object
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
        Pinnacle::Types::MessageContent.validate_raw(obj: obj.content)
        obj.cost&.is_a?(Float) != false || raise("Passed value for field obj.cost is not the expected type, validation failed.")
        obj.delivered_at&.is_a?(String) != false || raise("Passed value for field obj.delivered_at is not the expected type, validation failed.")
        obj.error&.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.method_.is_a?(Pinnacle::Types::MessageMethodEnum) != false || raise("Passed value for field obj.method_ is not the expected type, validation failed.")
        obj.num_segments.is_a?(Integer) != false || raise("Passed value for field obj.num_segments is not the expected type, validation failed.")
        obj.receiver.is_a?(String) != false || raise("Passed value for field obj.receiver is not the expected type, validation failed.")
        obj.sender.is_a?(String) != false || raise("Passed value for field obj.sender is not the expected type, validation failed.")
        obj.sent_at&.is_a?(String) != false || raise("Passed value for field obj.sent_at is not the expected type, validation failed.")
        obj.status.is_a?(Pinnacle::Types::MessageStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.type.is_a?(Pinnacle::Types::MessageProtocolEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      end
    end
  end
end
