# frozen_string_literal: true

require "json"
require_relative "click_action"
require_relative "location_share_action"

module Pinnacle
  class InboundButton
    # Deserialize a JSON object to an instance of InboundButton
    #
    # @param json_object [String]
    # @return [Pinnacle::InboundButton]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Pinnacle::ClickAction.validate_raw(obj: struct)
        return Pinnacle::ClickAction.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Pinnacle::LocationShareAction.validate_raw(obj: struct)
        return Pinnacle::LocationShareAction.from_json(json_object: struct) unless struct.nil?

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
        return Pinnacle::ClickAction.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Pinnacle::LocationShareAction.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
