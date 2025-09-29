# frozen_string_literal: true

require "json"
require_relative "rich_button"

module Pinnacle
  module Types
    # Raw button data. Contains the entire button that was clicked by the user. In
    #  rare cases where we cannot determine the exact button, this will return only the
    #  button title.
    class ButtonClickedDataButtonRaw
      # Deserialize a JSON object to an instance of ButtonClickedDataButtonRaw
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::ButtonClickedDataButtonRaw]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Pinnacle::Types::RichButton.validate_raw(obj: struct)
          return Pinnacle::Types::RichButton.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          struct.is_a?(String) != false || raise("Passed value for field struct is not the expected type, validation failed.")
          return struct unless struct.nil?

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
          return Pinnacle::Types::RichButton.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return obj.is_a?(String) != false || raise("Passed value for field obj is not the expected type, validation failed.")
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
