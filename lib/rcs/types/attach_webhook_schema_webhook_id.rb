# frozen_string_literal: true

require_relative "webhook_event_enum"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Attach a webhook you’ve already created in your account to this phone number.
    class AttachWebhookSchemaWebhookId
      # @return [Integer] The unique ID of the webhook you want to attach.<br>
      #  Make sure this webhook is active and able to receive event notifications.
      attr_reader :webhook_id
      # @return [Pinnacle::Types::WebhookEventEnum] Select the event type that will trigger this webhook. <br>
      #  Set to null if you want to listen to all event types for this phone number. <br>
      #  Defaults to null.
      attr_reader :event
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param webhook_id [Integer] The unique ID of the webhook you want to attach.<br>
      #  Make sure this webhook is active and able to receive event notifications.
      # @param event [Pinnacle::Types::WebhookEventEnum] Select the event type that will trigger this webhook. <br>
      #  Set to null if you want to listen to all event types for this phone number. <br>
      #  Defaults to null.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::AttachWebhookSchemaWebhookId]
      def initialize(webhook_id:, event: OMIT, additional_properties: nil)
        @webhook_id = webhook_id
        @event = event if event != OMIT
        @additional_properties = additional_properties
        @_field_set = { "webhookId": webhook_id, "event": event }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AttachWebhookSchemaWebhookId
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::AttachWebhookSchemaWebhookId]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        webhook_id = parsed_json["webhookId"]
        event = parsed_json["event"]
        new(
          webhook_id: webhook_id,
          event: event,
          additional_properties: struct
        )
      end

      # Serialize an instance of AttachWebhookSchemaWebhookId to a JSON object
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
        obj.webhook_id.is_a?(Integer) != false || raise("Passed value for field obj.webhook_id is not the expected type, validation failed.")
        obj.event&.is_a?(Pinnacle::Types::WebhookEventEnum) != false || raise("Passed value for field obj.event is not the expected type, validation failed.")
      end
    end
  end
end
