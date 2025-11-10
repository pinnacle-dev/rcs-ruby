# frozen_string_literal: true

require_relative "button_clicked_data_button"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Button click event data received when a user clicks on an RCS button or quick
    #  reply (excluding `requestUserLocation` buttons).
    #  This event contains information about which button was clicked, how many times
    #  it's been clicked, and any payload or metadata attached to the button. Use this
    #  data to handle user interactions with your RCS messages.
    class MessageEventRcsButtonData
      # @return [String] Message type identifier.
      attr_reader :type
      # @return [String] Unique identifier of the message. This identifier is a string that always begins
      #  with the prefix `msg_`, for example: `msg_1234567890`. <br><br>
      #  To get the message details, use the [GET
      #  /messages/{id}](/api-reference/messages/get) endpoint.
      attr_reader :id
      # @return [Pinnacle::Types::ButtonClickedDataButton] Information about the button that was clicked.
      attr_reader :button
      # @return [String] ID of the message this button was sent in, or null if not available. To get the
      #  message details, use the [GET /messages/{id}](/api-reference/messages/get)
      #  endpoint.
      attr_reader :message_id
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
      # @param button [Pinnacle::Types::ButtonClickedDataButton] Information about the button that was clicked.
      # @param message_id [String] ID of the message this button was sent in, or null if not available. To get the
      #  message details, use the [GET /messages/{id}](/api-reference/messages/get)
      #  endpoint.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::MessageEventRcsButtonData]
      def initialize(type:, id:, button:, message_id: OMIT, additional_properties: nil)
        @type = type
        @id = id
        @button = button
        @message_id = message_id if message_id != OMIT
        @additional_properties = additional_properties
        @_field_set = { "type": type, "id": id, "button": button, "messageId": message_id }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of MessageEventRcsButtonData
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::MessageEventRcsButtonData]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        type = parsed_json["type"]
        id = parsed_json["id"]
        if parsed_json["button"].nil?
          button = nil
        else
          button = parsed_json["button"].to_json
          button = Pinnacle::Types::ButtonClickedDataButton.from_json(json_object: button)
        end
        message_id = parsed_json["messageId"]
        new(
          type: type,
          id: id,
          button: button,
          message_id: message_id,
          additional_properties: struct
        )
      end

      # Serialize an instance of MessageEventRcsButtonData to a JSON object
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
        Pinnacle::Types::ButtonClickedDataButton.validate_raw(obj: obj.button)
        obj.message_id&.is_a?(String) != false || raise("Passed value for field obj.message_id is not the expected type, validation failed.")
      end
    end
  end
end
