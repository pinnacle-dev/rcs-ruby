# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    class SmsValidationResponseTotal
      # @return [Float] Total price of this message. Calculated by multiplying the number of GSM-7
      #  segments by the unit cost. <br>
      #  You must remove all unsupported UTF-16 characters before this message can be
      #  sent as GSM-7.
      attr_reader :gsm_7
      # @return [Float] Total price of this message. Calculated by multiplying the number of UTF-16
      #  segments by the unit cost.
      attr_reader :utf_16
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param gsm_7 [Float] Total price of this message. Calculated by multiplying the number of GSM-7
      #  segments by the unit cost. <br>
      #  You must remove all unsupported UTF-16 characters before this message can be
      #  sent as GSM-7.
      # @param utf_16 [Float] Total price of this message. Calculated by multiplying the number of UTF-16
      #  segments by the unit cost.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::SmsValidationResponseTotal]
      def initialize(gsm_7:, utf_16:, additional_properties: nil)
        @gsm_7 = gsm_7
        @utf_16 = utf_16
        @additional_properties = additional_properties
        @_field_set = { "gsm7": gsm_7, "utf16": utf_16 }
      end

      # Deserialize a JSON object to an instance of SmsValidationResponseTotal
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::SmsValidationResponseTotal]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        gsm_7 = parsed_json["gsm7"]
        utf_16 = parsed_json["utf16"]
        new(
          gsm_7: gsm_7,
          utf_16: utf_16,
          additional_properties: struct
        )
      end

      # Serialize an instance of SmsValidationResponseTotal to a JSON object
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
        obj.gsm_7.is_a?(Float) != false || raise("Passed value for field obj.gsm_7 is not the expected type, validation failed.")
        obj.utf_16.is_a?(Float) != false || raise("Passed value for field obj.utf_16 is not the expected type, validation failed.")
      end
    end
  end
end
