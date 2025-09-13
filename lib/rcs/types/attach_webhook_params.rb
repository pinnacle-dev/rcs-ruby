# frozen_string_literal: true

require "json"
require_relative "attach_webhook_by_id_params"
require_relative "create_and_attach_webhook_by_url_params"

module Pinnacle
  module Types
    # Use this request to connect a webhook to your phone number and receive real-time
    #  event notifications.
    #  You can either attach one of your existing webhooks by providing its ID or
    #  create a new webhook by specifying its name, URL, and event type.
    class AttachWebhookParams
      # Deserialize a JSON object to an instance of AttachWebhookParams
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::AttachWebhookParams]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Pinnacle::Types::AttachWebhookByIdParams.validate_raw(obj: struct)
          return Pinnacle::Types::AttachWebhookByIdParams.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::CreateAndAttachWebhookByUrlParams.validate_raw(obj: struct)
          return Pinnacle::Types::CreateAndAttachWebhookByUrlParams.from_json(json_object: struct) unless struct.nil?

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
          return Pinnacle::Types::AttachWebhookByIdParams.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::CreateAndAttachWebhookByUrlParams.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
