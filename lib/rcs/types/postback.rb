# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class Postback
    # @return [String] The type of action being sent
    attr_reader :action_type
    # @return [String] The postback payload. Maximum length is 1000 characters.
    attr_reader :payload
    # @return [String] The action to execute. Optional additional data sent when the button is tapped.
    attr_reader :execute
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param action_type [String] The type of action being sent
    # @param payload [String] The postback payload. Maximum length is 1000 characters.
    # @param execute [String] The action to execute. Optional additional data sent when the button is tapped.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::Postback]
    def initialize(action_type:, payload:, execute: OMIT, additional_properties: nil)
      @action_type = action_type
      @payload = payload
      @execute = execute if execute != OMIT
      @additional_properties = additional_properties
      @_field_set = { "action_type": action_type, "payload": payload, "execute": execute }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Postback
    #
    # @param json_object [String]
    # @return [Pinnacle::Postback]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      action_type = parsed_json["action_type"]
      payload = parsed_json["payload"]
      execute = parsed_json["execute"]
      new(
        action_type: action_type,
        payload: payload,
        execute: execute,
        additional_properties: struct
      )
    end

    # Serialize an instance of Postback to a JSON object
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
      obj.action_type.is_a?(String) != false || raise("Passed value for field obj.action_type is not the expected type, validation failed.")
      obj.payload.is_a?(String) != false || raise("Passed value for field obj.payload is not the expected type, validation failed.")
      obj.execute&.is_a?(String) != false || raise("Passed value for field obj.execute is not the expected type, validation failed.")
    end
  end
end
