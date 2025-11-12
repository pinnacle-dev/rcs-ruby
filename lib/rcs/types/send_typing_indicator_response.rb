# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Response schema confirming the typing indicator was sent.
    class SendTypingIndicatorResponse
      # @return [Boolean] Indicates whether the typing indicator was successfully sent.
      attr_reader :success
      # @return [String] The RCS agent that sent the typing indicator.
      attr_reader :agent_id
      # @return [String] The recipient's phone number that received the typing indicator.
      attr_reader :recipient
      # @return [DateTime] Timestamp when the typing indicator was started (ISO 8601 format).
      attr_reader :started_at
      # @return [DateTime] Timestamp when the typing indicator will automatically expire (ISO 8601 format).
      #  <br>
      #  This is typically one minute after `startedAt` unless a message is sent first.
      attr_reader :ended_at
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param success [Boolean] Indicates whether the typing indicator was successfully sent.
      # @param agent_id [String] The RCS agent that sent the typing indicator.
      # @param recipient [String] The recipient's phone number that received the typing indicator.
      # @param started_at [DateTime] Timestamp when the typing indicator was started (ISO 8601 format).
      # @param ended_at [DateTime] Timestamp when the typing indicator will automatically expire (ISO 8601 format).
      #  <br>
      #  This is typically one minute after `startedAt` unless a message is sent first.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::SendTypingIndicatorResponse]
      def initialize(success:, agent_id:, recipient:, started_at:, ended_at:, additional_properties: nil)
        @success = success
        @agent_id = agent_id
        @recipient = recipient
        @started_at = started_at
        @ended_at = ended_at
        @additional_properties = additional_properties
        @_field_set = {
          "success": success,
          "agentId": agent_id,
          "recipient": recipient,
          "startedAt": started_at,
          "endedAt": ended_at
        }
      end

      # Deserialize a JSON object to an instance of SendTypingIndicatorResponse
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::SendTypingIndicatorResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        success = parsed_json["success"]
        agent_id = parsed_json["agentId"]
        recipient = parsed_json["recipient"]
        started_at = (DateTime.parse(parsed_json["startedAt"]) unless parsed_json["startedAt"].nil?)
        ended_at = (DateTime.parse(parsed_json["endedAt"]) unless parsed_json["endedAt"].nil?)
        new(
          success: success,
          agent_id: agent_id,
          recipient: recipient,
          started_at: started_at,
          ended_at: ended_at,
          additional_properties: struct
        )
      end

      # Serialize an instance of SendTypingIndicatorResponse to a JSON object
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
        obj.success.is_a?(Boolean) != false || raise("Passed value for field obj.success is not the expected type, validation failed.")
        obj.agent_id.is_a?(String) != false || raise("Passed value for field obj.agent_id is not the expected type, validation failed.")
        obj.recipient.is_a?(String) != false || raise("Passed value for field obj.recipient is not the expected type, validation failed.")
        obj.started_at.is_a?(DateTime) != false || raise("Passed value for field obj.started_at is not the expected type, validation failed.")
        obj.ended_at.is_a?(DateTime) != false || raise("Passed value for field obj.ended_at is not the expected type, validation failed.")
      end
    end
  end
end
