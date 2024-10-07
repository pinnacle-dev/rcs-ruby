# frozen_string_literal: true

require "json"
require_relative "card_rcs"
require_relative "sms"
require_relative "basic_rcs"
require_relative "media_rcs"
require_relative "carousel_rcs"

module Pinnacle
  class SendMessageRequest
    # Deserialize a JSON object to an instance of SendMessageRequest
    #
    # @param json_object [String]
    # @return [Pinnacle::SendMessageRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Pinnacle::CardRcs.validate_raw(obj: struct)
        return Pinnacle::CardRcs.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Pinnacle::Sms.validate_raw(obj: struct)
        return Pinnacle::Sms.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Pinnacle::BasicRcs.validate_raw(obj: struct)
        return Pinnacle::BasicRcs.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Pinnacle::MediaRcs.validate_raw(obj: struct)
        return Pinnacle::MediaRcs.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Pinnacle::CarouselRcs.validate_raw(obj: struct)
        return Pinnacle::CarouselRcs.from_json(json_object: struct) unless struct.nil?

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
        return Pinnacle::CardRcs.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Pinnacle::Sms.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Pinnacle::BasicRcs.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Pinnacle::MediaRcs.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Pinnacle::CarouselRcs.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
