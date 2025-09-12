# frozen_string_literal: true

require "json"
require_relative "rcs_text_content"
require_relative "rcs_validate_content_media"
require_relative "rcs_cards"

module Pinnacle
  class RcsValidateContent
    # Deserialize a JSON object to an instance of RcsValidateContent
    #
    # @param json_object [String]
    # @return [Pinnacle::RcsValidateContent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Pinnacle::RcsTextContent.validate_raw(obj: struct)
        return Pinnacle::RcsTextContent.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Pinnacle::RcsValidateContentMedia.validate_raw(obj: struct)
        return Pinnacle::RcsValidateContentMedia.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Pinnacle::RcsCards.validate_raw(obj: struct)
        return Pinnacle::RcsCards.from_json(json_object: struct) unless struct.nil?

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
        return Pinnacle::RcsTextContent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Pinnacle::RcsValidateContentMedia.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Pinnacle::RcsCards.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
