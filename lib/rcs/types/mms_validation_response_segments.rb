# frozen_string_literal: true

require_relative "mms_validation_response_segments_value_item"
require "ostruct"
require "json"

module Pinnacle
  # Details about how the MMS content would be segmented for delivery.
  class MmsValidationResponseSegments
    # @return [Integer] Number of segments this message would be split into.
    attr_reader :count
    # @return [Array<String>] List of unsupported media files included in the message. <br>
    #  This may be because the file is unreachable or not supported by the MMS
    #  protocol. See [supported file
    #  types](https://app.pinnacle.sh/supported-file-types?type=MMS).
    attr_reader :unsupported_files
    # @return [Array<Pinnacle::MmsValidationResponseSegmentsValueItem>] Message segments with its content breakdown.
    attr_reader :value
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param count [Integer] Number of segments this message would be split into.
    # @param unsupported_files [Array<String>] List of unsupported media files included in the message. <br>
    #  This may be because the file is unreachable or not supported by the MMS
    #  protocol. See [supported file
    #  types](https://app.pinnacle.sh/supported-file-types?type=MMS).
    # @param value [Array<Pinnacle::MmsValidationResponseSegmentsValueItem>] Message segments with its content breakdown.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::MmsValidationResponseSegments]
    def initialize(count:, unsupported_files:, value:, additional_properties: nil)
      @count = count
      @unsupported_files = unsupported_files
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "count": count, "unsupportedFiles": unsupported_files, "value": value }
    end

    # Deserialize a JSON object to an instance of MmsValidationResponseSegments
    #
    # @param json_object [String]
    # @return [Pinnacle::MmsValidationResponseSegments]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      count = parsed_json["count"]
      unsupported_files = parsed_json["unsupportedFiles"]
      value = parsed_json["value"]&.map do |item|
        item = item.to_json
        Pinnacle::MmsValidationResponseSegmentsValueItem.from_json(json_object: item)
      end
      new(
        count: count,
        unsupported_files: unsupported_files,
        value: value,
        additional_properties: struct
      )
    end

    # Serialize an instance of MmsValidationResponseSegments to a JSON object
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
      obj.count.is_a?(Integer) != false || raise("Passed value for field obj.count is not the expected type, validation failed.")
      obj.unsupported_files.is_a?(Array) != false || raise("Passed value for field obj.unsupported_files is not the expected type, validation failed.")
      obj.value.is_a?(Array) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
