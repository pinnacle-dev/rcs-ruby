# frozen_string_literal: true

require_relative "mms_validation_response_segments"
require "ostruct"
require "json"

module Pinnacle
  class MmsValidationResult
    # @return [Pinnacle::MmsValidationResponseSegments] Details about how the MMS content would be segmented for delivery.
    attr_reader :segments
    # @return [Float] Total price of this message. Calculated by multiplying the number of segments by
    #  the unit cost.
    attr_reader :total
    # @return [Float] Cost of each segment.
    attr_reader :unit
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param segments [Pinnacle::MmsValidationResponseSegments] Details about how the MMS content would be segmented for delivery.
    # @param total [Float] Total price of this message. Calculated by multiplying the number of segments by
    #  the unit cost.
    # @param unit [Float] Cost of each segment.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::MmsValidationResult]
    def initialize(segments:, total:, unit:, additional_properties: nil)
      @segments = segments
      @total = total
      @unit = unit
      @additional_properties = additional_properties
      @_field_set = { "segments": segments, "total": total, "unit": unit }
    end

    # Deserialize a JSON object to an instance of MmsValidationResult
    #
    # @param json_object [String]
    # @return [Pinnacle::MmsValidationResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["segments"].nil?
        segments = nil
      else
        segments = parsed_json["segments"].to_json
        segments = Pinnacle::MmsValidationResponseSegments.from_json(json_object: segments)
      end
      total = parsed_json["total"]
      unit = parsed_json["unit"]
      new(
        segments: segments,
        total: total,
        unit: unit,
        additional_properties: struct
      )
    end

    # Serialize an instance of MmsValidationResult to a JSON object
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
      Pinnacle::MmsValidationResponseSegments.validate_raw(obj: obj.segments)
      obj.total.is_a?(Float) != false || raise("Passed value for field obj.total is not the expected type, validation failed.")
      obj.unit.is_a?(Float) != false || raise("Passed value for field obj.unit is not the expected type, validation failed.")
    end
  end
end
