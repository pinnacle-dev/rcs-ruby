# frozen_string_literal: true

require "json"
require_relative "phone"
require_relative "agent"

module Pinnacle
  module Types
    # The sender of messages in this conversation. Can be:
    #  - A phone number with its capabilities and metadata
    #  - An RCS agent with ID and name
    #  - `null` if no sender is associated
    class ConversationSender
      # Deserialize a JSON object to an instance of ConversationSender
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::ConversationSender]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Pinnacle::Types::Phone.validate_raw(obj: struct)
          return Pinnacle::Types::Phone.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Types::Agent.validate_raw(obj: struct)
          return Pinnacle::Types::Agent.from_json(json_object: struct) unless struct.nil?

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
          return Pinnacle::Types::Phone.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Types::Agent.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
