# frozen_string_literal: true

require "json"
require_relative "rcs_text"
require_relative "rcs_media"
require_relative "rcs_card"

module Pinnacle
  module Types
    class Rcs
      # Deserialize a JSON object to an instance of Rcs
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::Rcs]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Pinnacle::Types::RcsText.validate_raw(obj: struct)
          return Pinnacle::Types::RcsText.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::RcsMedia.validate_raw(obj: struct)
          return Pinnacle::Types::RcsMedia.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::RcsCard.validate_raw(obj: struct)
          return Pinnacle::Types::RcsCard.from_json(json_object: struct) unless struct.nil?

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
          return Pinnacle::Types::RcsText.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::RcsMedia.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::RcsCard.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
