# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module Pinnacle
  class MessageMetadata
    # @return [DateTime]
    attr_reader :timestamp
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param timestamp [DateTime]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::MessageMetadata]
    def initialize(timestamp:, additional_properties: nil)
      @timestamp = timestamp
      @additional_properties = additional_properties
      @_field_set = { "timestamp": timestamp }
    end

    # Deserialize a JSON object to an instance of MessageMetadata
    #
    # @param json_object [String]
    # @return [Pinnacle::MessageMetadata]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      timestamp = (DateTime.parse(parsed_json["timestamp"]) unless parsed_json["timestamp"].nil?)
      new(timestamp: timestamp, additional_properties: struct)
    end

    # Serialize an instance of MessageMetadata to a JSON object
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
      obj.timestamp.is_a?(DateTime) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
    end
  end
end
