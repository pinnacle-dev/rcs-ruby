# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Configuration for the scheduled message.
    class ScheduledSendResponseConfig
      # @return [String] When the message will be sent in ISO 8601 format.
      attr_reader :send_at
      # @return [String] AWS cron expression used for recurring messages.
      attr_reader :recurrence
      # @return [String] IANA timezone identifier.
      attr_reader :timezone
      # @return [String] When the recurring messages stops in ISO 8601 format.
      attr_reader :end_date
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param send_at [String] When the message will be sent in ISO 8601 format.
      # @param recurrence [String] AWS cron expression used for recurring messages.
      # @param timezone [String] IANA timezone identifier.
      # @param end_date [String] When the recurring messages stops in ISO 8601 format.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::ScheduledSendResponseConfig]
      def initialize(send_at:, timezone:, recurrence: OMIT, end_date: OMIT, additional_properties: nil)
        @send_at = send_at
        @recurrence = recurrence if recurrence != OMIT
        @timezone = timezone
        @end_date = end_date if end_date != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "sendAt": send_at,
          "recurrence": recurrence,
          "timezone": timezone,
          "endDate": end_date
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ScheduledSendResponseConfig
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::ScheduledSendResponseConfig]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        send_at = parsed_json["sendAt"]
        recurrence = parsed_json["recurrence"]
        timezone = parsed_json["timezone"]
        end_date = parsed_json["endDate"]
        new(
          send_at: send_at,
          recurrence: recurrence,
          timezone: timezone,
          end_date: end_date,
          additional_properties: struct
        )
      end

      # Serialize an instance of ScheduledSendResponseConfig to a JSON object
      #
      # @return [String]
      def to_json(*_args)
        @_field_set&.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.send_at.is_a?(String) != false || raise("Passed value for field obj.send_at is not the expected type, validation failed.")
        obj.recurrence&.is_a?(String) != false || raise("Passed value for field obj.recurrence is not the expected type, validation failed.")
        obj.timezone.is_a?(String) != false || raise("Passed value for field obj.timezone is not the expected type, validation failed.")
        obj.end_date&.is_a?(String) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
      end
    end
  end
end
