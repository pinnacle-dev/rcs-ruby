# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Response containing details about the scheduled blast.
    class BlastDetails
      # @return [String] Unique identifier for the blast. This identifier is a string that always begins
      #  with the prefix `blast_`, for example: `blast_1234567890`.
      attr_reader :blast_id
      # @return [String] The audience ID the blast was sent to. This identifier is a string that always
      #  begins with the prefix `aud_`, for example: `aud_abc123`.
      attr_reader :audience_id
      # @return [Integer] Total number of recipients in the audience.
      attr_reader :total_recipients
      # @return [Integer] Total number of messages to be sent.
      attr_reader :total_messages
      # @return [Integer] Total number of message segments across all messages.
      attr_reader :total_segments
      # @return [Float] Total estimated cost of the blast. Calculated by multiplying the number of
      #  segments by the number of messages by the unit cost.
      attr_reader :total_cost
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param blast_id [String] Unique identifier for the blast. This identifier is a string that always begins
      #  with the prefix `blast_`, for example: `blast_1234567890`.
      # @param audience_id [String] The audience ID the blast was sent to. This identifier is a string that always
      #  begins with the prefix `aud_`, for example: `aud_abc123`.
      # @param total_recipients [Integer] Total number of recipients in the audience.
      # @param total_messages [Integer] Total number of messages to be sent.
      # @param total_segments [Integer] Total number of message segments across all messages.
      # @param total_cost [Float] Total estimated cost of the blast. Calculated by multiplying the number of
      #  segments by the number of messages by the unit cost.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::BlastDetails]
      def initialize(blast_id:, audience_id:, total_recipients:, total_messages:, total_segments:, total_cost:,
                     additional_properties: nil)
        @blast_id = blast_id
        @audience_id = audience_id
        @total_recipients = total_recipients
        @total_messages = total_messages
        @total_segments = total_segments
        @total_cost = total_cost
        @additional_properties = additional_properties
        @_field_set = {
          "blastId": blast_id,
          "audienceId": audience_id,
          "totalRecipients": total_recipients,
          "totalMessages": total_messages,
          "totalSegments": total_segments,
          "totalCost": total_cost
        }
      end

      # Deserialize a JSON object to an instance of BlastDetails
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::BlastDetails]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        blast_id = parsed_json["blastId"]
        audience_id = parsed_json["audienceId"]
        total_recipients = parsed_json["totalRecipients"]
        total_messages = parsed_json["totalMessages"]
        total_segments = parsed_json["totalSegments"]
        total_cost = parsed_json["totalCost"]
        new(
          blast_id: blast_id,
          audience_id: audience_id,
          total_recipients: total_recipients,
          total_messages: total_messages,
          total_segments: total_segments,
          total_cost: total_cost,
          additional_properties: struct
        )
      end

      # Serialize an instance of BlastDetails to a JSON object
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
        obj.blast_id.is_a?(String) != false || raise("Passed value for field obj.blast_id is not the expected type, validation failed.")
        obj.audience_id.is_a?(String) != false || raise("Passed value for field obj.audience_id is not the expected type, validation failed.")
        obj.total_recipients.is_a?(Integer) != false || raise("Passed value for field obj.total_recipients is not the expected type, validation failed.")
        obj.total_messages.is_a?(Integer) != false || raise("Passed value for field obj.total_messages is not the expected type, validation failed.")
        obj.total_segments.is_a?(Integer) != false || raise("Passed value for field obj.total_segments is not the expected type, validation failed.")
        obj.total_cost.is_a?(Float) != false || raise("Passed value for field obj.total_cost is not the expected type, validation failed.")
      end
    end
  end
end
