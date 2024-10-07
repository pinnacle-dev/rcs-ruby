# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class PointOfContact
    # @return [String] Point of contact's name.
    attr_reader :poc_name
    # @return [String] Point of contact's title.
    attr_reader :poc_title
    # @return [String] Point of contact's email address.
    attr_reader :poc_email
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param poc_name [String] Point of contact's name.
    # @param poc_title [String] Point of contact's title.
    # @param poc_email [String] Point of contact's email address.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::PointOfContact]
    def initialize(poc_name:, poc_title:, poc_email:, additional_properties: nil)
      @poc_name = poc_name
      @poc_title = poc_title
      @poc_email = poc_email
      @additional_properties = additional_properties
      @_field_set = { "pocName": poc_name, "pocTitle": poc_title, "pocEmail": poc_email }
    end

    # Deserialize a JSON object to an instance of PointOfContact
    #
    # @param json_object [String]
    # @return [Pinnacle::PointOfContact]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      poc_name = parsed_json["pocName"]
      poc_title = parsed_json["pocTitle"]
      poc_email = parsed_json["pocEmail"]
      new(
        poc_name: poc_name,
        poc_title: poc_title,
        poc_email: poc_email,
        additional_properties: struct
      )
    end

    # Serialize an instance of PointOfContact to a JSON object
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
      obj.poc_name.is_a?(String) != false || raise("Passed value for field obj.poc_name is not the expected type, validation failed.")
      obj.poc_title.is_a?(String) != false || raise("Passed value for field obj.poc_title is not the expected type, validation failed.")
      obj.poc_email.is_a?(String) != false || raise("Passed value for field obj.poc_email is not the expected type, validation failed.")
    end
  end
end
