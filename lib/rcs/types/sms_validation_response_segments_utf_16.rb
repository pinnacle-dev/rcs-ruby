# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  # Segmentation details when your message is encoded with UTF-16.
  class SmsValidationResponseSegmentsUtf16
    # @return [Integer] Total number of bytes used by the UTF-16 segments.
    attr_reader :total_bytes
    # @return [Array<String>] Message broken down into segments using UTF-16 encoding.
    attr_reader :value
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param total_bytes [Integer] Total number of bytes used by the UTF-16 segments.
    # @param value [Array<String>] Message broken down into segments using UTF-16 encoding.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::SmsValidationResponseSegmentsUtf16]
    def initialize(total_bytes:, value:, additional_properties: nil)
      @total_bytes = total_bytes
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "totalBytes": total_bytes, "value": value }
    end

    # Deserialize a JSON object to an instance of SmsValidationResponseSegmentsUtf16
    #
    # @param json_object [String]
    # @return [Pinnacle::SmsValidationResponseSegmentsUtf16]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      total_bytes = parsed_json["totalBytes"]
      value = parsed_json["value"]
      new(
        total_bytes: total_bytes,
        value: value,
        additional_properties: struct
      )
    end

    # Serialize an instance of SmsValidationResponseSegmentsUtf16 to a JSON object
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
      obj.total_bytes.is_a?(Integer) != false || raise("Passed value for field obj.total_bytes is not the expected type, validation failed.")
      obj.value.is_a?(Array) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
