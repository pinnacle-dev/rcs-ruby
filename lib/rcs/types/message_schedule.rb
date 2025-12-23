# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Define when and how your message should be sent.
    class MessageSchedule
      # @return [String] The date and time you want your message to be sent.
      #  - Use [ISO 8601 format](https://en.wikipedia.org/wiki/ISO_8601), for example:
      #  `2024-12-17T14:30:00Z`. Format: `YYYY-MM-DDThh:mm` (e.g., `2024-12-25T14:30`).
      #  - This time must be at least 5 minutes in the future.
      #  - The message will be scheduled based on the `timezone` you provide.
      #  - If you set a `recurrence` schedule, this is the start date and time for the
      #  recurring schedule.
      attr_reader :send_at
      # @return [String] AWS cron expression for recurring schedules (6 fields). <br>
      #  [Learn more about cron
      #  ocs.aws.amazon.com/eventbridge/latest/userguide/eb-scheduled-rule-pattern.html).
      #  <br>
      #  **Examples:**
      #  - `0 10 * * ? *` - Every day at 10:00 AM
      #  - `0/30 * * * ? *` - Every 30 minutes
      #  - `0 9 ? * MON-FRI *` - Every weekday at 9:00 AM
      #  - `0 12 1 * ? *` - First day of every month at noon
      attr_reader :recurrence
      # @return [String] IANA timezone identifier (e.g., `America/New_York`, `UTC`). <br>
      #  Defaults to `UTC` if not specified.
      attr_reader :timezone
      # @return [String] Date and time when recurring messages should stop. <br>
      #  Format: `YYYY-MM-DDThh:mm`. Required if `recurrence` is set.
      attr_reader :end_date
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param send_at [String] The date and time you want your message to be sent.
      #  - Use [ISO 8601 format](https://en.wikipedia.org/wiki/ISO_8601), for example:
      #  `2024-12-17T14:30:00Z`. Format: `YYYY-MM-DDThh:mm` (e.g., `2024-12-25T14:30`).
      #  - This time must be at least 5 minutes in the future.
      #  - The message will be scheduled based on the `timezone` you provide.
      #  - If you set a `recurrence` schedule, this is the start date and time for the
      #  recurring schedule.
      # @param recurrence [String] AWS cron expression for recurring schedules (6 fields). <br>
      #  [Learn more about cron
      #  ocs.aws.amazon.com/eventbridge/latest/userguide/eb-scheduled-rule-pattern.html).
      #  <br>
      #  **Examples:**
      #  - `0 10 * * ? *` - Every day at 10:00 AM
      #  - `0/30 * * * ? *` - Every 30 minutes
      #  - `0 9 ? * MON-FRI *` - Every weekday at 9:00 AM
      #  - `0 12 1 * ? *` - First day of every month at noon
      # @param timezone [String] IANA timezone identifier (e.g., `America/New_York`, `UTC`). <br>
      #  Defaults to `UTC` if not specified.
      # @param end_date [String] Date and time when recurring messages should stop. <br>
      #  Format: `YYYY-MM-DDThh:mm`. Required if `recurrence` is set.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::MessageSchedule]
      def initialize(send_at:, recurrence: OMIT, timezone: OMIT, end_date: OMIT, additional_properties: nil)
        @send_at = send_at
        @recurrence = recurrence if recurrence != OMIT
        @timezone = timezone if timezone != OMIT
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

      # Deserialize a JSON object to an instance of MessageSchedule
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::MessageSchedule]
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
        obj.send_at.is_a?(String) != false || raise("Passed value for field obj.send_at is not the expected type, validation failed.")
        obj.recurrence&.is_a?(String) != false || raise("Passed value for field obj.recurrence is not the expected type, validation failed.")
        obj.timezone&.is_a?(String) != false || raise("Passed value for field obj.timezone is not the expected type, validation failed.")
        obj.end_date&.is_a?(String) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
      end
    end
  end
end
