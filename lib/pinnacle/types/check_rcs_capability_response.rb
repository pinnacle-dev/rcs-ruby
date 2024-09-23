# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class CheckRcsCapabilityResponse
    # @return [Boolean]
    attr_reader :success
    # @return [Boolean]
    attr_reader :rcs_enabled
    # @return [String]
    attr_reader :message
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param success [Boolean]
    # @param rcs_enabled [Boolean]
    # @param message [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::CheckRcsCapabilityResponse]
    def initialize(success: OMIT, rcs_enabled: OMIT, message: OMIT, additional_properties: nil)
      @success = success if success != OMIT
      @rcs_enabled = rcs_enabled if rcs_enabled != OMIT
      @message = message if message != OMIT
      @additional_properties = additional_properties
      @_field_set = { "success": success, "rcsEnabled": rcs_enabled, "message": message }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CheckRcsCapabilityResponse
    #
    # @param json_object [String]
    # @return [Pinnacle::CheckRcsCapabilityResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      success = parsed_json["success"]
      rcs_enabled = parsed_json["rcsEnabled"]
      message = parsed_json["message"]
      new(
        success: success,
        rcs_enabled: rcs_enabled,
        message: message,
        additional_properties: struct
      )
    end

    # Serialize an instance of CheckRcsCapabilityResponse to a JSON object
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
      obj.success&.is_a?(Boolean) != false || raise("Passed value for field obj.success is not the expected type, validation failed.")
      obj.rcs_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.rcs_enabled is not the expected type, validation failed.")
      obj.message&.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
    end
  end
end
