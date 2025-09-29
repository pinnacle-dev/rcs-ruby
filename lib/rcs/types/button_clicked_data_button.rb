# frozen_string_literal: true

require_relative "button_clicked_data_button_type"
require_relative "button_clicked_data_button_raw"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Information about the button that was clicked.
    class ButtonClickedDataButton
      # @return [Pinnacle::Types::ButtonClickedDataButtonType] Type of button clicked.
      #  - `CARD` for card buttons,
      #  - `QUICK_REPLY` for quick replies.
      #  - `null` if we cannot determine the button type. This is a rare edge case and is
      #  mainly here for backward compatibility.
      attr_reader :type
      # @return [Pinnacle::Types::ButtonClickedDataButtonRaw] Raw button data. Contains the entire button that was clicked by the user. In
      #  rare cases where we cannot determine the exact button, this will return only the
      #  button title.
      attr_reader :raw
      # @return [String] Extracted payload from the button's `payload` field, if provided. Provides quick
      #  access to any payload that was attached to the button.
      attr_reader :payload
      # @return [String] Additional metadata attached to the button's `metadata` field, if provided.
      attr_reader :metadata
      # @return [Integer] Number of times the button has been clicked.
      attr_reader :clicks
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param type [Pinnacle::Types::ButtonClickedDataButtonType] Type of button clicked.
      #  - `CARD` for card buttons,
      #  - `QUICK_REPLY` for quick replies.
      #  - `null` if we cannot determine the button type. This is a rare edge case and is
      #  mainly here for backward compatibility.
      # @param raw [Pinnacle::Types::ButtonClickedDataButtonRaw] Raw button data. Contains the entire button that was clicked by the user. In
      #  rare cases where we cannot determine the exact button, this will return only the
      #  button title.
      # @param payload [String] Extracted payload from the button's `payload` field, if provided. Provides quick
      #  access to any payload that was attached to the button.
      # @param metadata [String] Additional metadata attached to the button's `metadata` field, if provided.
      # @param clicks [Integer] Number of times the button has been clicked.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::ButtonClickedDataButton]
      def initialize(raw:, clicks:, type: OMIT, payload: OMIT, metadata: OMIT, additional_properties: nil)
        @type = type if type != OMIT
        @raw = raw
        @payload = payload if payload != OMIT
        @metadata = metadata if metadata != OMIT
        @clicks = clicks
        @additional_properties = additional_properties
        @_field_set = {
          "type": type,
          "raw": raw,
          "payload": payload,
          "metadata": metadata,
          "clicks": clicks
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ButtonClickedDataButton
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::ButtonClickedDataButton]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        type = parsed_json["type"]
        if parsed_json["raw"].nil?
          raw = nil
        else
          raw = parsed_json["raw"].to_json
          raw = Pinnacle::Types::ButtonClickedDataButtonRaw.from_json(json_object: raw)
        end
        payload = parsed_json["payload"]
        metadata = parsed_json["metadata"]
        clicks = parsed_json["clicks"]
        new(
          type: type,
          raw: raw,
          payload: payload,
          metadata: metadata,
          clicks: clicks,
          additional_properties: struct
        )
      end

      # Serialize an instance of ButtonClickedDataButton to a JSON object
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
        obj.type&.is_a?(Pinnacle::Types::ButtonClickedDataButtonType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        Pinnacle::Types::ButtonClickedDataButtonRaw.validate_raw(obj: obj.raw)
        obj.payload&.is_a?(String) != false || raise("Passed value for field obj.payload is not the expected type, validation failed.")
        obj.metadata&.is_a?(String) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
        obj.clicks.is_a?(Integer) != false || raise("Passed value for field obj.clicks is not the expected type, validation failed.")
      end
    end
  end
end
