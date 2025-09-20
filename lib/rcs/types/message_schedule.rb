# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Define when and how your message should be sent.
    class MessageSchedule
      # @return [String] Date and time when you want recurring messages to stop in ISO 8601 format.
      attr_reader :end_date
      # @return [String] Provide an AWS cron expression to control the when messages are sent. <br>
      #  [Learn more about cron
      #  ocs.aws.amazon.com/eventbridge/latest/userguide/eb-scheduled-rule-pattern.html).
      attr_reader :recurrence
      # @return [String] Date and time when you want to send your message in ISO 8601 format.
      attr_reader :send_at
      # @return [String] Timezone for your scheduled message, using an IANA identifier.
      attr_reader :timezone
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param end_date [String] Date and time when you want recurring messages to stop in ISO 8601 format.
      # @param recurrence [String] Provide an AWS cron expression to control the when messages are sent. <br>
      #  [Learn more about cron
      #  ocs.aws.amazon.com/eventbridge/latest/userguide/eb-scheduled-rule-pattern.html).
      # @param send_at [String] Date and time when you want to send your message in ISO 8601 format.
      # @param timezone [String] Timezone for your scheduled message, using an IANA identifier.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::MessageSchedule]
      def initialize(send_at:, timezone:, end_date: OMIT, recurrence: OMIT, additional_properties: nil)
        @end_date = end_date if end_date != OMIT
        @recurrence = recurrence if recurrence != OMIT
        @send_at = send_at
        @timezone = timezone
        @additional_properties = additional_properties
        @_field_set = {
          "endDate": end_date,
          "recurrence": recurrence,
          "sendAt": send_at,
          "timezone": timezone
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of MessageSchedule
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::MessageSchedule]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        end_date = parsed_json["endDate"]
        recurrence = parsed_json["recurrence"]
        send_at = parsed_json["sendAt"]
        timezone = parsed_json["timezone"]
        new(
          end_date: end_date,
          recurrence: recurrence,
          send_at: send_at,
          timezone: timezone,
          additional_properties: struct
        )
      end

      # Serialize an instance of MessageSchedule to a JSON object
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
        obj.end_date&.is_a?(String) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
        obj.recurrence&.is_a?(String) != false || raise("Passed value for field obj.recurrence is not the expected type, validation failed.")
        obj.send_at.is_a?(String) != false || raise("Passed value for field obj.send_at is not the expected type, validation failed.")
        obj.timezone.is_a?(String) != false || raise("Passed value for field obj.timezone is not the expected type, validation failed.")
      end
    end
  end
end
