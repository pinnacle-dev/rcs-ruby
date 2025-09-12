# frozen_string_literal: true

require "json"
require_relative "../../../types/sent_mms_details"
require_relative "../../../types/scheduled_messaage"

module Pinnacle
  module Messages
    class Send
      class SendMmsResponse
        # Deserialize a JSON object to an instance of SendMmsResponse
        #
        # @param json_object [String]
        # @return [Pinnacle::Messages::Send::SendMmsResponse]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          begin
            Pinnacle::SentMmsDetails.validate_raw(obj: struct)
            return Pinnacle::SentMmsDetails.from_json(json_object: struct) unless struct.nil?

            return nil
          rescue StandardError
            # noop
          end
          begin
            Pinnacle::ScheduledMessaage.validate_raw(obj: struct)
            return Pinnacle::ScheduledMessaage.from_json(json_object: struct) unless struct.nil?

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
            return Pinnacle::SentMmsDetails.validate_raw(obj: obj)
          rescue StandardError
            # noop
          end
          begin
            return Pinnacle::ScheduledMessaage.validate_raw(obj: obj)
          rescue StandardError
            # noop
          end
          raise("Passed value matched no type within the union, validation failed.")
        end
      end
    end
  end
end
