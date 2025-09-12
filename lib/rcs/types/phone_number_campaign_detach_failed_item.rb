# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class PhoneNumberCampaignDetachFailedItem
    # @return [String] Phone number (E.164 format).
    attr_reader :number
    # @return [String] Error related to why the number was not detached.
    attr_reader :error
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param number [String] Phone number (E.164 format).
    # @param error [String] Error related to why the number was not detached.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::PhoneNumberCampaignDetachFailedItem]
    def initialize(number:, error:, additional_properties: nil)
      @number = number
      @error = error
      @additional_properties = additional_properties
      @_field_set = { "number": number, "error": error }
    end

    # Deserialize a JSON object to an instance of PhoneNumberCampaignDetachFailedItem
    #
    # @param json_object [String]
    # @return [Pinnacle::PhoneNumberCampaignDetachFailedItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      number = parsed_json["number"]
      error = parsed_json["error"]
      new(
        number: number,
        error: error,
        additional_properties: struct
      )
    end

    # Serialize an instance of PhoneNumberCampaignDetachFailedItem to a JSON object
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
      obj.number.is_a?(String) != false || raise("Passed value for field obj.number is not the expected type, validation failed.")
      obj.error.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
    end
  end
end
