# frozen_string_literal: true

require "json"
require_relative "rich_text_message"
require_relative "rich_media_message"
require_relative "rich_cards_message"

module Pinnacle
  module Types
    class RichMessage
      # Deserialize a JSON object to an instance of RichMessage
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RichMessage]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Pinnacle::Types::RichTextMessage.validate_raw(obj: struct)
          return Pinnacle::Types::RichTextMessage.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::RichMediaMessage.validate_raw(obj: struct)
          return Pinnacle::Types::RichMediaMessage.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::RichCardsMessage.validate_raw(obj: struct)
          return Pinnacle::Types::RichCardsMessage.from_json(json_object: struct) unless struct.nil?

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
          return Pinnacle::Types::RichTextMessage.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::RichMediaMessage.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::RichCardsMessage.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
