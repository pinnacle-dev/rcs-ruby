# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Segmentation details when your message is encoded with GSM-7.
    class SmsValidationResponseSegmentsGsm7
      # @return [Integer] Total number of bytes used by the GSM-7 segments.
      attr_reader :total_bytes
      # @return [Array<String>] Characters not supported by GSM-7 encoding.
      attr_reader :unsupported
      # @return [Array<String>] Message broken down into segments using GSM-7 encoding.
      attr_reader :value
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param total_bytes [Integer] Total number of bytes used by the GSM-7 segments.
      # @param unsupported [Array<String>] Characters not supported by GSM-7 encoding.
      # @param value [Array<String>] Message broken down into segments using GSM-7 encoding.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::SmsValidationResponseSegmentsGsm7]
      def initialize(total_bytes:, unsupported:, value:, additional_properties: nil)
        @total_bytes = total_bytes
        @unsupported = unsupported
        @value = value
        @additional_properties = additional_properties
        @_field_set = { "totalBytes": total_bytes, "unsupported": unsupported, "value": value }
      end

      # Deserialize a JSON object to an instance of SmsValidationResponseSegmentsGsm7
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::SmsValidationResponseSegmentsGsm7]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        total_bytes = parsed_json["totalBytes"]
        unsupported = parsed_json["unsupported"]
        value = parsed_json["value"]
        new(
          total_bytes: total_bytes,
          unsupported: unsupported,
          value: value,
          additional_properties: struct
        )
      end

      # Serialize an instance of SmsValidationResponseSegmentsGsm7 to a JSON object
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
        obj.unsupported.is_a?(Array) != false || raise("Passed value for field obj.unsupported is not the expected type, validation failed.")
        obj.value.is_a?(Array) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      end
    end
  end
end
