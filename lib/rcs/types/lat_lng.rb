# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  # The latitude and longitude of the location to share with the user
  class LatLng
    # @return [Float] The latitude of the location
    attr_reader :lat
    # @return [Float] The longitude of the location
    attr_reader :lng
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param lat [Float] The latitude of the location
    # @param lng [Float] The longitude of the location
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::LatLng]
    def initialize(lat:, lng:, additional_properties: nil)
      @lat = lat
      @lng = lng
      @additional_properties = additional_properties
      @_field_set = { "lat": lat, "lng": lng }
    end

    # Deserialize a JSON object to an instance of LatLng
    #
    # @param json_object [String]
    # @return [Pinnacle::LatLng]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      lat = parsed_json["lat"]
      lng = parsed_json["lng"]
      new(
        lat: lat,
        lng: lng,
        additional_properties: struct
      )
    end

    # Serialize an instance of LatLng to a JSON object
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
      obj.lat.is_a?(Float) != false || raise("Passed value for field obj.lat is not the expected type, validation failed.")
      obj.lng.is_a?(Float) != false || raise("Passed value for field obj.lng is not the expected type, validation failed.")
    end
  end
end
