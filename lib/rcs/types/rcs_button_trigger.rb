# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  # Button that sends custom data back to your application when tapped by the
  #  recipient.
  class RcsButtonTrigger
    # @return [String] Additional data attached to the button interaction.
    attr_reader :metadata
    # @return [String] Custom data sent to your webhook when the button is tapped. Use this to identify
    #  the user's choice.
    attr_reader :payload
    # @return [String] Display text for the button.
    attr_reader :title
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param metadata [String] Additional data attached to the button interaction.
    # @param payload [String] Custom data sent to your webhook when the button is tapped. Use this to identify
    #  the user's choice.
    # @param title [String] Display text for the button.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::RcsButtonTrigger]
    def initialize(metadata:, payload:, title:, additional_properties: nil)
      @metadata = metadata
      @payload = payload
      @title = title
      @additional_properties = additional_properties
      @_field_set = { "metadata": metadata, "payload": payload, "title": title }
    end

    # Deserialize a JSON object to an instance of RcsButtonTrigger
    #
    # @param json_object [String]
    # @return [Pinnacle::RcsButtonTrigger]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      metadata = parsed_json["metadata"]
      payload = parsed_json["payload"]
      title = parsed_json["title"]
      new(
        metadata: metadata,
        payload: payload,
        title: title,
        additional_properties: struct
      )
    end

    # Serialize an instance of RcsButtonTrigger to a JSON object
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
      obj.metadata.is_a?(String) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
      obj.payload.is_a?(String) != false || raise("Passed value for field obj.payload is not the expected type, validation failed.")
      obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
    end
  end
end
