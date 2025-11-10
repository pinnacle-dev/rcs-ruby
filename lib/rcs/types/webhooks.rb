# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Webhook configuration that defines where event notifications are sent.
    class Webhooks
      # @return [String] URL where webhook events are delivered.
      attr_reader :endpoint
      # @return [String] The unique identifier of the webhook. This identifier is a string that always
      #  begins with the prefix `wh_`, for example: `wh_1234567890`.
      attr_reader :id
      # @return [String] Name of the webhook.
      attr_reader :name
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param endpoint [String] URL where webhook events are delivered.
      # @param id [String] The unique identifier of the webhook. This identifier is a string that always
      #  begins with the prefix `wh_`, for example: `wh_1234567890`.
      # @param name [String] Name of the webhook.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::Webhooks]
      def initialize(endpoint:, id:, name:, additional_properties: nil)
        @endpoint = endpoint
        @id = id
        @name = name
        @additional_properties = additional_properties
        @_field_set = { "endpoint": endpoint, "id": id, "name": name }
      end

      # Deserialize a JSON object to an instance of Webhooks
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::Webhooks]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        endpoint = parsed_json["endpoint"]
        id = parsed_json["id"]
        name = parsed_json["name"]
        new(
          endpoint: endpoint,
          id: id,
          name: name,
          additional_properties: struct
        )
      end

      # Serialize an instance of Webhooks to a JSON object
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
        obj.endpoint.is_a?(String) != false || raise("Passed value for field obj.endpoint is not the expected type, validation failed.")
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      end
    end
  end
end
