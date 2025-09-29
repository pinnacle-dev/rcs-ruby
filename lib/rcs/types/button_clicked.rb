# frozen_string_literal: true

require "json"
require_relative "button_clicked_data"
require_relative "location_share_action"

module Pinnacle
  module Types
    class ButtonClicked
      # Deserialize a JSON object to an instance of ButtonClicked
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::ButtonClicked]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Pinnacle::Types::ButtonClickedData.validate_raw(obj: struct)
          return Pinnacle::Types::ButtonClickedData.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::LocationShareAction.validate_raw(obj: struct)
          return Pinnacle::Types::LocationShareAction.from_json(json_object: struct) unless struct.nil?

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
          return Pinnacle::Types::ButtonClickedData.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::LocationShareAction.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
