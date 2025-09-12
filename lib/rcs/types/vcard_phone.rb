# frozen_string_literal: true

require_relative "v_card_phone_schema_type_item"
require "ostruct"
require "json"

module Pinnacle
  class VcardPhone
    # @return [Array<Pinnacle::VCardPhoneSchemaTypeItem>] Phone number type classifications.
    attr_reader :type
    # @return [String] Phone number in any format.
    attr_reader :value
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [Array<Pinnacle::VCardPhoneSchemaTypeItem>] Phone number type classifications.
    # @param value [String] Phone number in any format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::VcardPhone]
    def initialize(type: OMIT, value: OMIT, additional_properties: nil)
      @type = type if type != OMIT
      @value = value if value != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "value": value }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of VcardPhone
    #
    # @param json_object [String]
    # @return [Pinnacle::VcardPhone]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      value = parsed_json["value"]
      new(
        type: type,
        value: value,
        additional_properties: struct
      )
    end

    # Serialize an instance of VcardPhone to a JSON object
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
      obj.type&.is_a?(Array) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
