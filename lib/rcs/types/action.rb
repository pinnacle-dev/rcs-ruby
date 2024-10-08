# frozen_string_literal: true

require "json"
require_relative "url"
require_relative "call"
require_relative "postback"
require_relative "share_location"
require_relative "view_location"

module Pinnacle
  class Action
    # Deserialize a JSON object to an instance of Action
    #
    # @param json_object [String]
    # @return [Pinnacle::Action]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Pinnacle::Url.validate_raw(obj: struct)
        return Pinnacle::Url.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Pinnacle::Call.validate_raw(obj: struct)
        return Pinnacle::Call.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Pinnacle::Postback.validate_raw(obj: struct)
        return Pinnacle::Postback.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Pinnacle::ShareLocation.validate_raw(obj: struct)
        return Pinnacle::ShareLocation.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Pinnacle::ViewLocation.validate_raw(obj: struct)
        return Pinnacle::ViewLocation.from_json(json_object: struct) unless struct.nil?

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
        return Pinnacle::Url.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Pinnacle::Call.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Pinnacle::Postback.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Pinnacle::ShareLocation.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Pinnacle::ViewLocation.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
