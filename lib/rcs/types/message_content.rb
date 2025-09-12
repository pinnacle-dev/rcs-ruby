# frozen_string_literal: true

require "json"
require_relative "sms_content"
require_relative "mms_content"
require_relative "rcs_content"
require_relative "inbound_button"

module Pinnacle
  module Types
    # Content type of the message.
    class MessageContent
      # Deserialize a JSON object to an instance of MessageContent
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::MessageContent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Pinnacle::Types::SmsContent.validate_raw(obj: struct)
          return Pinnacle::Types::SmsContent.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::MmsContent.validate_raw(obj: struct)
          return Pinnacle::Types::MmsContent.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::RcsContent.validate_raw(obj: struct)
          return Pinnacle::Types::RcsContent.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::InboundButton.validate_raw(obj: struct)
          return Pinnacle::Types::InboundButton.from_json(json_object: struct) unless struct.nil?

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
          return Pinnacle::Types::SmsContent.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::MmsContent.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::RcsContent.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::InboundButton.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
