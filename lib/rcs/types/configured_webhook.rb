# frozen_string_literal: true

require_relative "attach_webhook_response_webhook"
require_relative "webhook_event_enum"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Confirmation that a webhook has been successfully attached to the specified
    #  phone number.
    #  Includes detailed webhook information, the subscribed event type, and the
    #  associated phone number.
    class ConfiguredWebhook
      # @return [Pinnacle::Types::AttachWebhookResponseWebhook] Detailed information about the attached webhook.
      attr_reader :webhook
      # @return [Pinnacle::Types::WebhookEventEnum] Specific event type configured for this webhook attachment.
      attr_reader :event
      # @return [String] Phone number in E.164 format that is linked to the webhook.
      attr_reader :phone_number
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param webhook [Pinnacle::Types::AttachWebhookResponseWebhook] Detailed information about the attached webhook.
      # @param event [Pinnacle::Types::WebhookEventEnum] Specific event type configured for this webhook attachment.
      # @param phone_number [String] Phone number in E.164 format that is linked to the webhook.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::ConfiguredWebhook]
      def initialize(webhook:, event:, phone_number:, additional_properties: nil)
        @webhook = webhook
        @event = event
        @phone_number = phone_number
        @additional_properties = additional_properties
        @_field_set = { "webhook": webhook, "event": event, "phoneNumber": phone_number }
      end

      # Deserialize a JSON object to an instance of ConfiguredWebhook
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::ConfiguredWebhook]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["webhook"].nil?
          webhook = nil
        else
          webhook = parsed_json["webhook"].to_json
          webhook = Pinnacle::Types::AttachWebhookResponseWebhook.from_json(json_object: webhook)
        end
        event = parsed_json["event"]
        phone_number = parsed_json["phoneNumber"]
        new(
          webhook: webhook,
          event: event,
          phone_number: phone_number,
          additional_properties: struct
        )
      end

      # Serialize an instance of ConfiguredWebhook to a JSON object
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
        Pinnacle::Types::AttachWebhookResponseWebhook.validate_raw(obj: obj.webhook)
        obj.event.is_a?(Pinnacle::Types::WebhookEventEnum) != false || raise("Passed value for field obj.event is not the expected type, validation failed.")
        obj.phone_number.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
      end
    end
  end
end
