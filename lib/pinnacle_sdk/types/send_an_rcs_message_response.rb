# frozen_string_literal: true

require "json"
require_relative "rcs_message_sent"
require_relative "sms_message_sent"

module Pinnacle
  class SendAnRcsMessageResponse
    # Deserialize a JSON object to an instance of SendAnRcsMessageResponse
    #
    # @param json_object [String]
    # @return [Pinnacle::SendAnRcsMessageResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Pinnacle::RcsMessageSent.validate_raw(obj: struct)
        return Pinnacle::RcsMessageSent.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Pinnacle::SmsMessageSent.validate_raw(obj: struct)
        return Pinnacle::SmsMessageSent.from_json(json_object: struct) unless struct.nil?

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
        return Pinnacle::RcsMessageSent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Pinnacle::SmsMessageSent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
