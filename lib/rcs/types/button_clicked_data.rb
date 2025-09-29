# frozen_string_literal: true

require_relative "button_clicked_data_button"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Unified data structure for button click events.
    class ButtonClickedData
      # @return [Pinnacle::Types::ButtonClickedDataButton] Information about the button that was clicked.
      attr_reader :button
      # @return [Integer] ID of the message this button was attached to, or null if not available. To get
      #  the message details, use the [GET /messages/{id}](/api-reference/messages/get)
      #  endpoint.
      attr_reader :message_id
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param button [Pinnacle::Types::ButtonClickedDataButton] Information about the button that was clicked.
      # @param message_id [Integer] ID of the message this button was attached to, or null if not available. To get
      #  the message details, use the [GET /messages/{id}](/api-reference/messages/get)
      #  endpoint.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::ButtonClickedData]
      def initialize(button:, message_id: OMIT, additional_properties: nil)
        @button = button
        @message_id = message_id if message_id != OMIT
        @additional_properties = additional_properties
        @_field_set = { "button": button, "messageId": message_id }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ButtonClickedData
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::ButtonClickedData]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["button"].nil?
          button = nil
        else
          button = parsed_json["button"].to_json
          button = Pinnacle::Types::ButtonClickedDataButton.from_json(json_object: button)
        end
        message_id = parsed_json["messageId"]
        new(
          button: button,
          message_id: message_id,
          additional_properties: struct
        )
      end

      # Serialize an instance of ButtonClickedData to a JSON object
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
        Pinnacle::Types::ButtonClickedDataButton.validate_raw(obj: obj.button)
        obj.message_id&.is_a?(Integer) != false || raise("Passed value for field obj.message_id is not the expected type, validation failed.")
      end
    end
  end
end
