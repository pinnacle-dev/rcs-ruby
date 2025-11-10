# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    class DetachedWebhookInfo
      # @return [String] Confirmation message.
      attr_reader :message
      # @return [String] Unique identifier of the webhook within the account. This identifier is a string
      #  that always begins with the prefix `wh_`, for example: `wh_1234567890`.
      attr_reader :webhook_id
      # @return [String] Phone number the webhook was detached from in E.164 format.
      attr_reader :phone_number
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param message [String] Confirmation message.
      # @param webhook_id [String] Unique identifier of the webhook within the account. This identifier is a string
      #  that always begins with the prefix `wh_`, for example: `wh_1234567890`.
      # @param phone_number [String] Phone number the webhook was detached from in E.164 format.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::DetachedWebhookInfo]
      def initialize(message:, webhook_id:, phone_number:, additional_properties: nil)
        @message = message
        @webhook_id = webhook_id
        @phone_number = phone_number
        @additional_properties = additional_properties
        @_field_set = { "message": message, "webhookId": webhook_id, "phoneNumber": phone_number }
      end

      # Deserialize a JSON object to an instance of DetachedWebhookInfo
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::DetachedWebhookInfo]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        message = parsed_json["message"]
        webhook_id = parsed_json["webhookId"]
        phone_number = parsed_json["phoneNumber"]
        new(
          message: message,
          webhook_id: webhook_id,
          phone_number: phone_number,
          additional_properties: struct
        )
      end

      # Serialize an instance of DetachedWebhookInfo to a JSON object
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
        obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
        obj.webhook_id.is_a?(String) != false || raise("Passed value for field obj.webhook_id is not the expected type, validation failed.")
        obj.phone_number.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
      end
    end
  end
end
