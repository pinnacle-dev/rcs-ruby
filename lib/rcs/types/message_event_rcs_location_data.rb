# frozen_string_literal: true

require_relative "location_share_action_data"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Location sharing event data received when a user responds to a
    #  `requestUserLocation` button and shares their current location.
    #  This event contains the geographic coordinates (latitude/longitude) and
    #  human-readable address of the location the user chose to share. Use this data to
    #  process location-based requests or provide location-specific services.
    class MessageEventRcsLocationData
      # @return [String] Message type identifier.
      attr_reader :type
      # @return [String] Unique identifier of the message. This identifier is a string that always begins
      #  with the prefix `msg_`, for example: `msg_1234567890`. <br><br>
      #  To get the message details, use the [GET
      #  /messages/{id}](/api-reference/messages/get) endpoint.
      attr_reader :id
      # @return [Pinnacle::Types::LocationShareActionData] Location data shared by the user.
      attr_reader :data
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param type [String] Message type identifier.
      # @param id [String] Unique identifier of the message. This identifier is a string that always begins
      #  with the prefix `msg_`, for example: `msg_1234567890`. <br><br>
      #  To get the message details, use the [GET
      #  /messages/{id}](/api-reference/messages/get) endpoint.
      # @param data [Pinnacle::Types::LocationShareActionData] Location data shared by the user.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::MessageEventRcsLocationData]
      def initialize(type:, id:, data:, additional_properties: nil)
        @type = type
        @id = id
        @data = data
        @additional_properties = additional_properties
        @_field_set = { "type": type, "id": id, "data": data }
      end

      # Deserialize a JSON object to an instance of MessageEventRcsLocationData
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::MessageEventRcsLocationData]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        type = parsed_json["type"]
        id = parsed_json["id"]
        if parsed_json["data"].nil?
          data = nil
        else
          data = parsed_json["data"].to_json
          data = Pinnacle::Types::LocationShareActionData.from_json(json_object: data)
        end
        new(
          type: type,
          id: id,
          data: data,
          additional_properties: struct
        )
      end

      # Serialize an instance of MessageEventRcsLocationData to a JSON object
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
        obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        Pinnacle::Types::LocationShareActionData.validate_raw(obj: obj.data)
      end
    end
  end
end
