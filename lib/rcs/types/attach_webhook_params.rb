# frozen_string_literal: true

require "json"
require_relative "attach_webhook_schema_webhook_id"
require_relative "attach_webhook_schema_name"

module Pinnacle
  # Use this request to connect a webhook to your phone number and receive real-time
  #  event notifications.
  #  You can either attach one of your existing webhooks by providing its ID or
  #  create a new webhook by specifying its name, URL, and event type.
  class AttachWebhookParams
    # Deserialize a JSON object to an instance of AttachWebhookParams
    #
    # @param json_object [String]
    # @return [Pinnacle::AttachWebhookParams]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Pinnacle::AttachWebhookSchemaWebhookId.validate_raw(obj: struct)
        return Pinnacle::AttachWebhookSchemaWebhookId.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Pinnacle::AttachWebhookSchemaName.validate_raw(obj: struct)
        return Pinnacle::AttachWebhookSchemaName.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      struct
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return Pinnacle::AttachWebhookSchemaWebhookId.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Pinnacle::AttachWebhookSchemaName.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
