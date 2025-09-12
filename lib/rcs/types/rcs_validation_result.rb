# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class RcsValidationResult
    # @return [Float] Total price of this message. Calculated by multiplying the number of messages by
    #  the unit cost.
    attr_reader :total
    # @return [Float] Cost per message.
    attr_reader :unit
    # @return [Array<String>] List of unsupported media file names or URLs.
    attr_reader :unsupported_files
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param total [Float] Total price of this message. Calculated by multiplying the number of messages by
    #  the unit cost.
    # @param unit [Float] Cost per message.
    # @param unsupported_files [Array<String>] List of unsupported media file names or URLs.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::RcsValidationResult]
    def initialize(total:, unit:, unsupported_files:, additional_properties: nil)
      @total = total
      @unit = unit
      @unsupported_files = unsupported_files
      @additional_properties = additional_properties
      @_field_set = { "total": total, "unit": unit, "unsupportedFiles": unsupported_files }
    end

    # Deserialize a JSON object to an instance of RcsValidationResult
    #
    # @param json_object [String]
    # @return [Pinnacle::RcsValidationResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      total = parsed_json["total"]
      unit = parsed_json["unit"]
      unsupported_files = parsed_json["unsupportedFiles"]
      new(
        total: total,
        unit: unit,
        unsupported_files: unsupported_files,
        additional_properties: struct
      )
    end

    # Serialize an instance of RcsValidationResult to a JSON object
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
      obj.total.is_a?(Float) != false || raise("Passed value for field obj.total is not the expected type, validation failed.")
      obj.unit.is_a?(Float) != false || raise("Passed value for field obj.unit is not the expected type, validation failed.")
      obj.unsupported_files.is_a?(Array) != false || raise("Passed value for field obj.unsupported_files is not the expected type, validation failed.")
    end
  end
end
