# frozen_string_literal: true

require "json"
require_relative "rcs_text"
require_relative "rcs_media"
require_relative "rcs_card"

module Pinnacle
  class Rcs
    # Deserialize a JSON object to an instance of Rcs
    #
    # @param json_object [String]
    # @return [Pinnacle::Rcs]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Pinnacle::RcsText.validate_raw(obj: struct)
        return Pinnacle::RcsText.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Pinnacle::RcsMedia.validate_raw(obj: struct)
        return Pinnacle::RcsMedia.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Pinnacle::RcsCard.validate_raw(obj: struct)
        return Pinnacle::RcsCard.from_json(json_object: struct) unless struct.nil?

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
        return Pinnacle::RcsText.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Pinnacle::RcsMedia.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Pinnacle::RcsCard.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
