# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class Send
    class SendRcsResponse
      # @return [String] The unique ID of the sent message.
      attr_reader :message_id
      # @return [String] A message indicating the status of the sent message.
      attr_reader :message
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param message_id [String] The unique ID of the sent message.
      # @param message [String] A message indicating the status of the sent message.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Send::SendRcsResponse]
      def initialize(message_id:, message:, additional_properties: nil)
        @message_id = message_id
        @message = message
        @additional_properties = additional_properties
        @_field_set = { "messageId": message_id, "message": message }
      end

      # Deserialize a JSON object to an instance of SendRcsResponse
      #
      # @param json_object [String]
      # @return [Pinnacle::Send::SendRcsResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        message_id = parsed_json["messageId"]
        message = parsed_json["message"]
        new(
          message_id: message_id,
          message: message,
          additional_properties: struct
        )
      end

      # Serialize an instance of SendRcsResponse to a JSON object
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
        obj.message_id.is_a?(String) != false || raise("Passed value for field obj.message_id is not the expected type, validation failed.")
        obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      end
    end
  end
end
