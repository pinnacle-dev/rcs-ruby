# frozen_string_literal: true

require "json"
require_relative "rcs_text_content"
require_relative "rcs_media_content"
require_relative "rcs_cards_content"

module Pinnacle
  # Message with richer content (longer text, media files, cards, and buttons) from
  #  interacting with an RCS agent.
  class RcsContent
    # Deserialize a JSON object to an instance of RcsContent
    #
    # @param json_object [String]
    # @return [Pinnacle::RcsContent]
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
        Pinnacle::RcsMediaContent.validate_raw(obj: struct)
        return Pinnacle::RcsMediaContent.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Pinnacle::RcsCardsContent.validate_raw(obj: struct)
        return Pinnacle::RcsCardsContent.from_json(json_object: struct) unless struct.nil?

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
        return Pinnacle::RcsMediaContent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Pinnacle::RcsCardsContent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
