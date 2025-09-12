# frozen_string_literal: true

require_relative "send_sms_response_segments_encoding"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Details about how the message was segmented for sending.
    class SendSmsResponseSegments
      # @return [Float] Number of message segments used to send this message.
      attr_reader :count
      # @return [Pinnacle::Types::SendSmsResponseSegmentsEncoding] Encoding used for the message segments.
      attr_reader :encoding
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param count [Float] Number of message segments used to send this message.
      # @param encoding [Pinnacle::Types::SendSmsResponseSegmentsEncoding] Encoding used for the message segments.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::SendSmsResponseSegments]
      def initialize(count:, encoding:, additional_properties: nil)
        @count = count
        @encoding = encoding
        @additional_properties = additional_properties
        @_field_set = { "count": count, "encoding": encoding }
      end

      # Deserialize a JSON object to an instance of SendSmsResponseSegments
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::SendSmsResponseSegments]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        count = parsed_json["count"]
        encoding = parsed_json["encoding"]
        new(
          count: count,
          encoding: encoding,
          additional_properties: struct
        )
      end

      # Serialize an instance of SendSmsResponseSegments to a JSON object
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
        obj.count.is_a?(Float) != false || raise("Passed value for field obj.count is not the expected type, validation failed.")
        obj.encoding.is_a?(Pinnacle::Types::SendSmsResponseSegmentsEncoding) != false || raise("Passed value for field obj.encoding is not the expected type, validation failed.")
      end
    end
  end
end
