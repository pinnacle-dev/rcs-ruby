# frozen_string_literal: true

require "json"
require_relative "rcs_text_content"
require_relative "rcs_validate_content_media"
require_relative "rcs_cards"

module Pinnacle
  module Types
    class RcsValidateContent
      # Deserialize a JSON object to an instance of RcsValidateContent
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RcsValidateContent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Pinnacle::Types::RcsTextContent.validate_raw(obj: struct)
          return Pinnacle::Types::RcsTextContent.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::RcsValidateContentMedia.validate_raw(obj: struct)
          return Pinnacle::Types::RcsValidateContentMedia.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::RcsCards.validate_raw(obj: struct)
          return Pinnacle::Types::RcsCards.from_json(json_object: struct) unless struct.nil?

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
          return Pinnacle::Types::RcsTextContent.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::RcsValidateContentMedia.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::RcsCards.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
