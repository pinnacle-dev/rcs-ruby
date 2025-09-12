# frozen_string_literal: true

require_relative "webhooks"
require "ostruct"
require "json"

module Pinnacle
  # Response containing all webhooks that match the requested identifiers.
  #  Only includes the essential webhook information needed for identification and
  #  management.
  class WebhookResult
    # @return [Array<Pinnacle::Webhooks>] List of webhooks.
    attr_reader :webhooks
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param webhooks [Array<Pinnacle::Webhooks>] List of webhooks.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::WebhookResult]
    def initialize(webhooks:, additional_properties: nil)
      @webhooks = webhooks
      @additional_properties = additional_properties
      @_field_set = { "webhooks": webhooks }
    end

    # Deserialize a JSON object to an instance of WebhookResult
    #
    # @param json_object [String]
    # @return [Pinnacle::WebhookResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      webhooks = parsed_json["webhooks"]&.map do |item|
        item = item.to_json
        Pinnacle::Webhooks.from_json(json_object: item)
      end
      new(webhooks: webhooks, additional_properties: struct)
    end

    # Serialize an instance of WebhookResult to a JSON object
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
      obj.webhooks.is_a?(Array) != false || raise("Passed value for field obj.webhooks is not the expected type, validation failed.")
    end
  end
end
