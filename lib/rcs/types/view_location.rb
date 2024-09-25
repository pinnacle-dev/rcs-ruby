# frozen_string_literal: true

require_relative "lat_lng"
require "ostruct"
require "json"

module Pinnacle
  class ViewLocation
    # @return [String] The title for the view location action. Maximum length is 25 characters.
    attr_reader :title
    # @return [String] The type of action being sent
    attr_reader :action_type
    # @return [Pinnacle::LatLng]
    attr_reader :lat_lng
    # @return [String] The name of the location
    attr_reader :label
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param title [String] The title for the view location action. Maximum length is 25 characters.
    # @param action_type [String] The type of action being sent
    # @param lat_lng [Pinnacle::LatLng]
    # @param label [String] The name of the location
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::ViewLocation]
    def initialize(action_type:, lat_lng:, label:, title: OMIT, additional_properties: nil)
      @title = title if title != OMIT
      @action_type = action_type
      @lat_lng = lat_lng
      @label = label
      @additional_properties = additional_properties
      @_field_set = {
        "title": title,
        "action_type": action_type,
        "lat_lng": lat_lng,
        "label": label
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ViewLocation
    #
    # @param json_object [String]
    # @return [Pinnacle::ViewLocation]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      title = parsed_json["title"]
      action_type = parsed_json["action_type"]
      if parsed_json["lat_lng"].nil?
        lat_lng = nil
      else
        lat_lng = parsed_json["lat_lng"].to_json
        lat_lng = Pinnacle::LatLng.from_json(json_object: lat_lng)
      end
      label = parsed_json["label"]
      new(
        title: title,
        action_type: action_type,
        lat_lng: lat_lng,
        label: label,
        additional_properties: struct
      )
    end

    # Serialize an instance of ViewLocation to a JSON object
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
      obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      obj.action_type.is_a?(String) != false || raise("Passed value for field obj.action_type is not the expected type, validation failed.")
      Pinnacle::LatLng.validate_raw(obj: obj.lat_lng)
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
    end
  end
end
