# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  # Information about the country of registration.
  class BasicPhoneInformationLocationCountry
    # @return [String] Two-letter country code where the number is registered.
    attr_reader :code
    # @return [String] Full name of the country.
    attr_reader :name
    # @return [String] International dialing prefix for the country.
    attr_reader :prefix
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param code [String] Two-letter country code where the number is registered.
    # @param name [String] Full name of the country.
    # @param prefix [String] International dialing prefix for the country.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::BasicPhoneInformationLocationCountry]
    def initialize(code:, name:, prefix:, additional_properties: nil)
      @code = code
      @name = name
      @prefix = prefix
      @additional_properties = additional_properties
      @_field_set = { "code": code, "name": name, "prefix": prefix }
    end

    # Deserialize a JSON object to an instance of BasicPhoneInformationLocationCountry
    #
    # @param json_object [String]
    # @return [Pinnacle::BasicPhoneInformationLocationCountry]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      code = parsed_json["code"]
      name = parsed_json["name"]
      prefix = parsed_json["prefix"]
      new(
        code: code,
        name: name,
        prefix: prefix,
        additional_properties: struct
      )
    end

    # Serialize an instance of BasicPhoneInformationLocationCountry to a JSON object
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
      obj.code.is_a?(String) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.prefix.is_a?(String) != false || raise("Passed value for field obj.prefix is not the expected type, validation failed.")
    end
  end
end
