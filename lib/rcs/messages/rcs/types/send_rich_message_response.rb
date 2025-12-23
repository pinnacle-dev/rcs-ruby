# frozen_string_literal: true

require "json"
require_relative "../../../types/sent_rich_message"
require_relative "../../../types/scheduled_message"

module Pinnacle
  module Messages
    module Rcs
      module Types
        class SendRichMessageResponse
          # Deserialize a JSON object to an instance of SendRichMessageResponse
          #
          # @param json_object [String]
          # @return [Pinnacle::Messages::Rcs::Types::SendRichMessageResponse]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            begin
              Pinnacle::Types::SentRichMessage.validate_raw(obj: struct)
              return Pinnacle::Types::SentRichMessage.from_json(json_object: struct) unless struct.nil?

              return nil
            rescue StandardError
              # noop
            end
            begin
              Pinnacle::Types::ScheduledMessage.validate_raw(obj: struct)
              return Pinnacle::Types::ScheduledMessage.from_json(json_object: struct) unless struct.nil?

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
              return Pinnacle::Types::SentRichMessage.validate_raw(obj: obj)
            rescue StandardError
              # noop
            end
            begin
              return Pinnacle::Types::ScheduledMessage.validate_raw(obj: obj)
            rescue StandardError
              # noop
            end
            raise("Passed value matched no type within the union, validation failed.")
          end
        end
      end
    end
  end
end
