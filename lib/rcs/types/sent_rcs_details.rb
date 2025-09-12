# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class SentRcsDetails
    # @return [Float] Unique identifier for the sent MMS messages.
    attr_reader :message_ids
    # @return [Integer] Total number of segments used across the message.
    attr_reader :segments
    # @return [Float] Total cost of sending the message.
    attr_reader :total_cost
    # @return [String] Sender's phone number in E.164 format.
    attr_reader :sender
    # @return [String] Recipient's phone number in E.164 format.
    attr_reader :recipient
    # @return [String] Current status of the message.
    attr_reader :status
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param message_ids [Float] Unique identifier for the sent MMS messages.
    # @param segments [Integer] Total number of segments used across the message.
    # @param total_cost [Float] Total cost of sending the message.
    # @param sender [String] Sender's phone number in E.164 format.
    # @param recipient [String] Recipient's phone number in E.164 format.
    # @param status [String] Current status of the message.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::SentRcsDetails]
    def initialize(segments:, total_cost:, sender:, recipient:, status:, message_ids: OMIT, additional_properties: nil)
      @message_ids = message_ids if message_ids != OMIT
      @segments = segments
      @total_cost = total_cost
      @sender = sender
      @recipient = recipient
      @status = status
      @additional_properties = additional_properties
      @_field_set = {
        "messageIds": message_ids,
        "segments": segments,
        "totalCost": total_cost,
        "sender": sender,
        "recipient": recipient,
        "status": status
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of SentRcsDetails
    #
    # @param json_object [String]
    # @return [Pinnacle::SentRcsDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      message_ids = parsed_json["messageIds"]
      segments = parsed_json["segments"]
      total_cost = parsed_json["totalCost"]
      sender = parsed_json["sender"]
      recipient = parsed_json["recipient"]
      status = parsed_json["status"]
      new(
        message_ids: message_ids,
        segments: segments,
        total_cost: total_cost,
        sender: sender,
        recipient: recipient,
        status: status,
        additional_properties: struct
      )
    end

    # Serialize an instance of SentRcsDetails to a JSON object
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
      obj.message_ids&.is_a?(Float) != false || raise("Passed value for field obj.message_ids is not the expected type, validation failed.")
      obj.segments.is_a?(Integer) != false || raise("Passed value for field obj.segments is not the expected type, validation failed.")
      obj.total_cost.is_a?(Float) != false || raise("Passed value for field obj.total_cost is not the expected type, validation failed.")
      obj.sender.is_a?(String) != false || raise("Passed value for field obj.sender is not the expected type, validation failed.")
      obj.recipient.is_a?(String) != false || raise("Passed value for field obj.recipient is not the expected type, validation failed.")
      obj.status.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end
