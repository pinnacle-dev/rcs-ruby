# frozen_string_literal: true

require_relative "sms_validation_response_segments"
require_relative "sms_validation_response_total"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class SmsValidationResult
      # @return [Boolean] Indicates if the message exceeds the allowed segment limit. <br>
      #  For SMS, this is limit is 10.
      attr_reader :is_over_segment_limit
      # @return [Pinnacle::Types::SmsValidationResponseSegments] Details about how the SMS content would be segmented for delivery.
      attr_reader :segments
      # @return [Pinnacle::Types::SmsValidationResponseTotal]
      attr_reader :total
      # @return [Float] Cost per message segment.
      attr_reader :unit
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param is_over_segment_limit [Boolean] Indicates if the message exceeds the allowed segment limit. <br>
      #  For SMS, this is limit is 10.
      # @param segments [Pinnacle::Types::SmsValidationResponseSegments] Details about how the SMS content would be segmented for delivery.
      # @param total [Pinnacle::Types::SmsValidationResponseTotal]
      # @param unit [Float] Cost per message segment.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::SmsValidationResult]
      def initialize(segments:, total:, unit:, is_over_segment_limit: OMIT, additional_properties: nil)
        @is_over_segment_limit = is_over_segment_limit if is_over_segment_limit != OMIT
        @segments = segments
        @total = total
        @unit = unit
        @additional_properties = additional_properties
        @_field_set = {
          "isOverSegmentLimit": is_over_segment_limit,
          "segments": segments,
          "total": total,
          "unit": unit
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of SmsValidationResult
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::SmsValidationResult]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        is_over_segment_limit = parsed_json["isOverSegmentLimit"]
        if parsed_json["segments"].nil?
          segments = nil
        else
          segments = parsed_json["segments"].to_json
          segments = Pinnacle::Types::SmsValidationResponseSegments.from_json(json_object: segments)
        end
        if parsed_json["total"].nil?
          total = nil
        else
          total = parsed_json["total"].to_json
          total = Pinnacle::Types::SmsValidationResponseTotal.from_json(json_object: total)
        end
        unit = parsed_json["unit"]
        new(
          is_over_segment_limit: is_over_segment_limit,
          segments: segments,
          total: total,
          unit: unit,
          additional_properties: struct
        )
      end

      # Serialize an instance of SmsValidationResult to a JSON object
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
        obj.is_over_segment_limit&.is_a?(Boolean) != false || raise("Passed value for field obj.is_over_segment_limit is not the expected type, validation failed.")
        Pinnacle::Types::SmsValidationResponseSegments.validate_raw(obj: obj.segments)
        Pinnacle::Types::SmsValidationResponseTotal.validate_raw(obj: obj.total)
        obj.unit.is_a?(Float) != false || raise("Passed value for field obj.unit is not the expected type, validation failed.")
      end
    end
  end
end
