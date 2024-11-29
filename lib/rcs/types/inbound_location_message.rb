# frozen_string_literal: true

require_relative "inbound_location_message_coordinates"
require_relative "inbound_message_metadata"
require "ostruct"
require "json"

module Pinnacle
  class InboundLocationMessage
    # @return [String]
    attr_reader :message_type
    # @return [Pinnacle::InboundLocationMessageCoordinates]
    attr_reader :coordinates
    # @return [String]
    attr_reader :from
    # @return [String]
    attr_reader :to
    # @return [Pinnacle::InboundMessageMetadata]
    attr_reader :metadata
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param message_type [String]
    # @param coordinates [Pinnacle::InboundLocationMessageCoordinates]
    # @param from [String]
    # @param to [String]
    # @param metadata [Pinnacle::InboundMessageMetadata]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::InboundLocationMessage]
    def initialize(coordinates:, from:, to:, message_type: OMIT, metadata: OMIT, additional_properties: nil)
      @message_type = message_type if message_type != OMIT
      @coordinates = coordinates
      @from = from
      @to = to
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "messageType": message_type,
        "coordinates": coordinates,
        "from": from,
        "to": to,
        "metadata": metadata
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of InboundLocationMessage
    #
    # @param json_object [String]
    # @return [Pinnacle::InboundLocationMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      message_type = parsed_json["messageType"]
      if parsed_json["coordinates"].nil?
        coordinates = nil
      else
        coordinates = parsed_json["coordinates"].to_json
        coordinates = Pinnacle::InboundLocationMessageCoordinates.from_json(json_object: coordinates)
      end
      from = parsed_json["from"]
      to = parsed_json["to"]
      if parsed_json["metadata"].nil?
        metadata = nil
      else
        metadata = parsed_json["metadata"].to_json
        metadata = Pinnacle::InboundMessageMetadata.from_json(json_object: metadata)
      end
      new(
        message_type: message_type,
        coordinates: coordinates,
        from: from,
        to: to,
        metadata: metadata,
        additional_properties: struct
      )
    end

    # Serialize an instance of InboundLocationMessage to a JSON object
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
      obj.message_type&.is_a?(String) != false || raise("Passed value for field obj.message_type is not the expected type, validation failed.")
      Pinnacle::InboundLocationMessageCoordinates.validate_raw(obj: obj.coordinates)
      obj.from.is_a?(String) != false || raise("Passed value for field obj.from is not the expected type, validation failed.")
      obj.to.is_a?(String) != false || raise("Passed value for field obj.to is not the expected type, validation failed.")
      obj.metadata.nil? || Pinnacle::InboundMessageMetadata.validate_raw(obj: obj.metadata)
    end
  end
end
