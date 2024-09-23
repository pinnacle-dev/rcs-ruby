# frozen_string_literal: true

require "json"
require_relative "rcs_message"
require_relative "sms_message"

module Pinnacle
  class SendAnRcsMessageRequestBody
    # Deserialize a JSON object to an instance of SendAnRcsMessageRequestBody
    #
    # @param json_object [String]
    # @return [Pinnacle::SendAnRcsMessageRequestBody]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Pinnacle::RcsMessage.validate_raw(obj: struct)
        return Pinnacle::RcsMessage.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Pinnacle::SmsMessage.validate_raw(obj: struct)
        return Pinnacle::SmsMessage.from_json(json_object: struct) unless struct.nil?

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
        return Pinnacle::RcsMessage.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Pinnacle::SmsMessage.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
