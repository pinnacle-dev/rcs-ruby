# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  # Multiple formatting representations of the same phone number for different use
  #  cases.
  #  Provides flexibility for display, storage, and integration requirements.
  class NumberFormat
    # @return [String] Phone number in E.164 format with country code prefix.
    attr_reader :international
    # @return [String] Phone number formatted according to national conventions. <br>
    #  Includes parentheses, spaces, and dashes as commonly used in the country.
    attr_reader :national
    # @return [String] Phone number with only digits, no formatting or country code prefix.
    attr_reader :raw
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param international [String] Phone number in E.164 format with country code prefix.
    # @param national [String] Phone number formatted according to national conventions. <br>
    #  Includes parentheses, spaces, and dashes as commonly used in the country.
    # @param raw [String] Phone number with only digits, no formatting or country code prefix.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::NumberFormat]
    def initialize(international:, national:, raw:, additional_properties: nil)
      @international = international
      @national = national
      @raw = raw
      @additional_properties = additional_properties
      @_field_set = { "international": international, "national": national, "raw": raw }
    end

    # Deserialize a JSON object to an instance of NumberFormat
    #
    # @param json_object [String]
    # @return [Pinnacle::NumberFormat]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      international = parsed_json["international"]
      national = parsed_json["national"]
      raw = parsed_json["raw"]
      new(
        international: international,
        national: national,
        raw: raw,
        additional_properties: struct
      )
    end

    # Serialize an instance of NumberFormat to a JSON object
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
      obj.international.is_a?(String) != false || raise("Passed value for field obj.international is not the expected type, validation failed.")
      obj.national.is_a?(String) != false || raise("Passed value for field obj.national is not the expected type, validation failed.")
      obj.raw.is_a?(String) != false || raise("Passed value for field obj.raw is not the expected type, validation failed.")
    end
  end
end
