# frozen_string_literal: true

require_relative "inbound_message_message_type"
require_relative "inbound_message_metadata"
require "ostruct"
require "json"

module Pinnacle
  class InboundMessage
    # @return [String]
    attr_reader :from
    # @return [String]
    attr_reader :to
    # @return [Pinnacle::InboundMessageMessageType]
    attr_reader :message_type
    # @return [Pinnacle::InboundMessageMetadata]
    attr_reader :metadata
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param from [String]
    # @param to [String]
    # @param message_type [Pinnacle::InboundMessageMessageType]
    # @param metadata [Pinnacle::InboundMessageMetadata]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::InboundMessage]
    def initialize(from:, to:, message_type:, metadata: OMIT, additional_properties: nil)
      @from = from
      @to = to
      @message_type = message_type
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = { "from": from, "to": to, "messageType": message_type, "metadata": metadata }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of InboundMessage
    #
    # @param json_object [String]
    # @return [Pinnacle::InboundMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      from = parsed_json["from"]
      to = parsed_json["to"]
      message_type = parsed_json["messageType"]
      if parsed_json["metadata"].nil?
        metadata = nil
      else
        metadata = parsed_json["metadata"].to_json
        metadata = Pinnacle::InboundMessageMetadata.from_json(json_object: metadata)
      end
      new(
        from: from,
        to: to,
        message_type: message_type,
        metadata: metadata,
        additional_properties: struct
      )
    end

    # Serialize an instance of InboundMessage to a JSON object
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
      obj.from.is_a?(String) != false || raise("Passed value for field obj.from is not the expected type, validation failed.")
      obj.to.is_a?(String) != false || raise("Passed value for field obj.to is not the expected type, validation failed.")
      obj.message_type.is_a?(Pinnacle::InboundMessageMessageType) != false || raise("Passed value for field obj.message_type is not the expected type, validation failed.")
      obj.metadata.nil? || Pinnacle::InboundMessageMetadata.validate_raw(obj: obj.metadata)
    end
  end
end
