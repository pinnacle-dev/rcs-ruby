# frozen_string_literal: true

require "json"
require_relative "message_event_sms_content"
require_relative "message_event_mms_content"
require_relative "message_event_rcs_text_content"
require_relative "message_event_rcs_media_content"
require_relative "message_event_rcs_cards_content"
require_relative "message_event_rcs_button_data"
require_relative "message_event_rcs_location_data"

module Pinnacle
  module Types
    # Content of an incoming or outgoing message. Discriminated by the `type` field.
    class MessageEventContent
      # Deserialize a JSON object to an instance of MessageEventContent
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::MessageEventContent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Pinnacle::Types::MessageEventSmsContent.validate_raw(obj: struct)
          return Pinnacle::Types::MessageEventSmsContent.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::MessageEventMmsContent.validate_raw(obj: struct)
          return Pinnacle::Types::MessageEventMmsContent.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::MessageEventRcsTextContent.validate_raw(obj: struct)
          return Pinnacle::Types::MessageEventRcsTextContent.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::MessageEventRcsMediaContent.validate_raw(obj: struct)
          return Pinnacle::Types::MessageEventRcsMediaContent.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::MessageEventRcsCardsContent.validate_raw(obj: struct)
          return Pinnacle::Types::MessageEventRcsCardsContent.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::MessageEventRcsButtonData.validate_raw(obj: struct)
          return Pinnacle::Types::MessageEventRcsButtonData.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::MessageEventRcsLocationData.validate_raw(obj: struct)
          return Pinnacle::Types::MessageEventRcsLocationData.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        struct
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        begin
          return Pinnacle::Types::MessageEventSmsContent.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::MessageEventMmsContent.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::MessageEventRcsTextContent.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::MessageEventRcsMediaContent.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::MessageEventRcsCardsContent.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::MessageEventRcsButtonData.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::MessageEventRcsLocationData.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
