# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  # Location data shared by the user.
  class LocationShareActionData
    # @return [String] Address corresponding to the shared location.
    attr_reader :address
    # @return [Float] Latitude of the shared location.
    attr_reader :latitude
    # @return [Float] Longitude of the shared location.
    attr_reader :longitude
    # @return [String] Text message sent with the location.
    attr_reader :text
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param address [String] Address corresponding to the shared location.
    # @param latitude [Float] Latitude of the shared location.
    # @param longitude [Float] Longitude of the shared location.
    # @param text [String] Text message sent with the location.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::LocationShareActionData]
    def initialize(address:, latitude:, longitude:, text: OMIT, additional_properties: nil)
      @address = address
      @latitude = latitude
      @longitude = longitude
      @text = text if text != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "text": text
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of LocationShareActionData
    #
    # @param json_object [String]
    # @return [Pinnacle::LocationShareActionData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      address = parsed_json["address"]
      latitude = parsed_json["latitude"]
      longitude = parsed_json["longitude"]
      text = parsed_json["text"]
      new(
        address: address,
        latitude: latitude,
        longitude: longitude,
        text: text,
        additional_properties: struct
      )
    end

    # Serialize an instance of LocationShareActionData to a JSON object
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
      obj.address.is_a?(String) != false || raise("Passed value for field obj.address is not the expected type, validation failed.")
      obj.latitude.is_a?(Float) != false || raise("Passed value for field obj.latitude is not the expected type, validation failed.")
      obj.longitude.is_a?(Float) != false || raise("Passed value for field obj.longitude is not the expected type, validation failed.")
      obj.text&.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
    end
  end
end
