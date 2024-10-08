# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class InternalServerErrorBody
    # @return [Boolean]
    attr_reader :success
    # @return [String]
    attr_reader :error
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param success [Boolean]
    # @param error [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::InternalServerErrorBody]
    def initialize(success: OMIT, error: OMIT, additional_properties: nil)
      @success = success if success != OMIT
      @error = error if error != OMIT
      @additional_properties = additional_properties
      @_field_set = { "success": success, "error": error }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of InternalServerErrorBody
    #
    # @param json_object [String]
    # @return [Pinnacle::InternalServerErrorBody]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      success = parsed_json["success"]
      error = parsed_json["error"]
      new(
        success: success,
        error: error,
        additional_properties: struct
      )
    end

    # Serialize an instance of InternalServerErrorBody to a JSON object
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
      obj.error&.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
    end
  end
end
