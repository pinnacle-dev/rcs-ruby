# frozen_string_literal: true

require_relative "click_action_data"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class ClickAction
      # @return [String] Title of the button or quick reply that was clicked on.
      attr_reader :button
      # @return [Pinnacle::Types::ClickActionData] Payload received from the button interaction.
      attr_reader :data
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param button [String] Title of the button or quick reply that was clicked on.
      # @param data [Pinnacle::Types::ClickActionData] Payload received from the button interaction.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::ClickAction]
      def initialize(button:, data:, additional_properties: nil)
        @button = button
        @data = data
        @additional_properties = additional_properties
        @_field_set = { "button": button, "data": data }
      end

      # Deserialize a JSON object to an instance of ClickAction
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::ClickAction]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        button = parsed_json["button"]
        if parsed_json["data"].nil?
          data = nil
        else
          data = parsed_json["data"].to_json
          data = Pinnacle::Types::ClickActionData.from_json(json_object: data)
        end
        new(
          button: button,
          data: data,
          additional_properties: struct
        )
      end

      # Serialize an instance of ClickAction to a JSON object
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
        obj.button.is_a?(String) != false || raise("Passed value for field obj.button is not the expected type, validation failed.")
        Pinnacle::Types::ClickActionData.validate_raw(obj: obj.data)
      end
    end
  end
end
