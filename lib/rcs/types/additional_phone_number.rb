# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class AdditionalPhoneNumber
    # @return [String] Additional phone number in international format.
    attr_reader :phone
    # @return [String] Label for the additional phone number.
    attr_reader :label
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param phone [String] Additional phone number in international format.
    # @param label [String] Label for the additional phone number.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::AdditionalPhoneNumber]
    def initialize(phone:, label:, additional_properties: nil)
      @phone = phone
      @label = label
      @additional_properties = additional_properties
      @_field_set = { "phone": phone, "label": label }
    end

    # Deserialize a JSON object to an instance of AdditionalPhoneNumber
    #
    # @param json_object [String]
    # @return [Pinnacle::AdditionalPhoneNumber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      phone = parsed_json["phone"]
      label = parsed_json["label"]
      new(
        phone: phone,
        label: label,
        additional_properties: struct
      )
    end

    # Serialize an instance of AdditionalPhoneNumber to a JSON object
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
      obj.phone.is_a?(String) != false || raise("Passed value for field obj.phone is not the expected type, validation failed.")
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
    end
  end
end
