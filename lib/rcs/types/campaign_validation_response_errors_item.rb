# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class CampaignValidationResponseErrorsItem
    # @return [String] A human-readable description of the error.
    attr_reader :description
    # @return [String] An example of a valid value for the field.
    attr_reader :example
    # @return [String] The field that is not valid.
    attr_reader :field
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param description [String] A human-readable description of the error.
    # @param example [String] An example of a valid value for the field.
    # @param field [String] The field that is not valid.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::CampaignValidationResponseErrorsItem]
    def initialize(description:, field:, example: OMIT, additional_properties: nil)
      @description = description
      @example = example if example != OMIT
      @field = field
      @additional_properties = additional_properties
      @_field_set = { "description": description, "example": example, "field": field }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CampaignValidationResponseErrorsItem
    #
    # @param json_object [String]
    # @return [Pinnacle::CampaignValidationResponseErrorsItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      description = parsed_json["description"]
      example = parsed_json["example"]
      field = parsed_json["field"]
      new(
        description: description,
        example: example,
        field: field,
        additional_properties: struct
      )
    end

    # Serialize an instance of CampaignValidationResponseErrorsItem to a JSON object
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
      obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.example&.is_a?(String) != false || raise("Passed value for field obj.example is not the expected type, validation failed.")
      obj.field.is_a?(String) != false || raise("Passed value for field obj.field is not the expected type, validation failed.")
    end
  end
end
