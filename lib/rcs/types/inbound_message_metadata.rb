# frozen_string_literal: true

require_relative "sender_metadata"
require_relative "message_metadata"
require "ostruct"
require "json"

module Pinnacle
  class InboundMessageMetadata
    # @return [Pinnacle::SenderMetadata]
    attr_reader :sender
    # @return [Pinnacle::MessageMetadata]
    attr_reader :message
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param sender [Pinnacle::SenderMetadata]
    # @param message [Pinnacle::MessageMetadata]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::InboundMessageMetadata]
    def initialize(sender: OMIT, message: OMIT, additional_properties: nil)
      @sender = sender if sender != OMIT
      @message = message if message != OMIT
      @additional_properties = additional_properties
      @_field_set = { "sender": sender, "message": message }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of InboundMessageMetadata
    #
    # @param json_object [String]
    # @return [Pinnacle::InboundMessageMetadata]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["sender"].nil?
        sender = nil
      else
        sender = parsed_json["sender"].to_json
        sender = Pinnacle::SenderMetadata.from_json(json_object: sender)
      end
      if parsed_json["message"].nil?
        message = nil
      else
        message = parsed_json["message"].to_json
        message = Pinnacle::MessageMetadata.from_json(json_object: message)
      end
      new(
        sender: sender,
        message: message,
        additional_properties: struct
      )
    end

    # Serialize an instance of InboundMessageMetadata to a JSON object
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
      obj.sender.nil? || Pinnacle::SenderMetadata.validate_raw(obj: obj.sender)
      obj.message.nil? || Pinnacle::MessageMetadata.validate_raw(obj: obj.message)
    end
  end
end
