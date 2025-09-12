# frozen_string_literal: true

require_relative "location_share_action_data"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class LocationShareAction
      # @return [Pinnacle::Types::LocationShareActionData] Location data shared by the user.
      attr_reader :data
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param data [Pinnacle::Types::LocationShareActionData] Location data shared by the user.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::LocationShareAction]
      def initialize(data:, additional_properties: nil)
        @data = data
        @additional_properties = additional_properties
        @_field_set = { "data": data }
      end

      # Deserialize a JSON object to an instance of LocationShareAction
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::LocationShareAction]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["data"].nil?
          data = nil
        else
          data = parsed_json["data"].to_json
          data = Pinnacle::Types::LocationShareActionData.from_json(json_object: data)
        end
        new(data: data, additional_properties: struct)
      end

      # Serialize an instance of LocationShareAction to a JSON object
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
        Pinnacle::Types::LocationShareActionData.validate_raw(obj: obj.data)
      end
    end
  end
end
