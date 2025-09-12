# frozen_string_literal: true

require_relative "webhook_event_enum"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Create a new webhook and immediately attach it to your phone number.
    class AttachWebhookSchemaName
      # @return [String] Name of your new webhook.
      attr_reader :name
      # @return [String] HTTPS endpoint where your webhook events will be sent as HTTP POST requests.
      #  <br>
      #  Ensure this URL is publicly accessible and ready to handle incoming webhook
      #  calls.
      attr_reader :url
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

      # @param name [String] Name of your new webhook.
      # @param url [String] HTTPS endpoint where your webhook events will be sent as HTTP POST requests.
      #  <br>
      #  Ensure this URL is publicly accessible and ready to handle incoming webhook
      #  calls.
      # @param event [Pinnacle::Types::WebhookEventEnum] Select the event type that will trigger this webhook. <br>
      #  Set to null if you want to listen to all event types for this phone number. <br>
      #  Defaults to null.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::AttachWebhookSchemaName]
      def initialize(name:, url:, event: OMIT, additional_properties: nil)
        @name = name
        @url = url
        @event = event if event != OMIT
        @additional_properties = additional_properties
        @_field_set = { "name": name, "url": url, "event": event }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AttachWebhookSchemaName
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::AttachWebhookSchemaName]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = parsed_json["name"]
        url = parsed_json["url"]
        event = parsed_json["event"]
        new(
          name: name,
          url: url,
          event: event,
          additional_properties: struct
        )
      end

      # Serialize an instance of AttachWebhookSchemaName to a JSON object
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
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
        obj.event&.is_a?(Pinnacle::Types::WebhookEventEnum) != false || raise("Passed value for field obj.event is not the expected type, validation failed.")
      end
    end
  end
end
