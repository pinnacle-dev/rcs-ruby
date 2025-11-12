# frozen_string_literal: true

require_relative "rcs_button_send_location_lat_long"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Button that shares a specific location with the recipient when tapped.
    class RcsButtonSendLocation
      # @return [String] Optional name or label for the location that will be displayed in the map app
      #  (e.g., "Central Park", "Home Office").
      #  If not provided, the button title will be used as the location name.
      attr_reader :name
      # @return [Pinnacle::Types::RcsButtonSendLocationLatLong] Geographic coordinates of the location to share.
      attr_reader :lat_long
      # @return [String] Display text for the button.
      attr_reader :title
      # @return [String] Optional additional data to attach to this button.
      attr_reader :metadata
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param name [String] Optional name or label for the location that will be displayed in the map app
      #  (e.g., "Central Park", "Home Office").
      #  If not provided, the button title will be used as the location name.
      # @param lat_long [Pinnacle::Types::RcsButtonSendLocationLatLong] Geographic coordinates of the location to share.
      # @param title [String] Display text for the button.
      # @param metadata [String] Optional additional data to attach to this button.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RcsButtonSendLocation]
      def initialize(lat_long:, title:, name: OMIT, metadata: OMIT, additional_properties: nil)
        @name = name if name != OMIT
        @lat_long = lat_long
        @title = title
        @metadata = metadata if metadata != OMIT
        @additional_properties = additional_properties
        @_field_set = { "name": name, "latLong": lat_long, "title": title, "metadata": metadata }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RcsButtonSendLocation
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RcsButtonSendLocation]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = parsed_json["name"]
        if parsed_json["latLong"].nil?
          lat_long = nil
        else
          lat_long = parsed_json["latLong"].to_json
          lat_long = Pinnacle::Types::RcsButtonSendLocationLatLong.from_json(json_object: lat_long)
        end
        title = parsed_json["title"]
        metadata = parsed_json["metadata"]
        new(
          name: name,
          lat_long: lat_long,
          title: title,
          metadata: metadata,
          additional_properties: struct
        )
      end

      # Serialize an instance of RcsButtonSendLocation to a JSON object
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
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        Pinnacle::Types::RcsButtonSendLocationLatLong.validate_raw(obj: obj.lat_long)
        obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
        obj.metadata&.is_a?(String) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
      end
    end
  end
end
