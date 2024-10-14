# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class InternalServerErrorBody
    # @return [Array<String>]
    attr_reader :errors
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<String>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::InternalServerErrorBody]
    def initialize(errors: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors }.reject do |_k, v|
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
      errors = parsed_json["errors"]
      new(errors: errors, additional_properties: struct)
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end
