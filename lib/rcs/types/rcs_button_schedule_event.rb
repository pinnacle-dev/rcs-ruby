# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Button that prompts the recipient to add an event to their calendar.
    class RcsButtonScheduleEvent
      # @return [String] Detailed description for the calendar event.
      attr_reader :event_description
      # @return [String] End time in ISO 8601 format.
      attr_reader :event_end_time
      # @return [String] Starting time in ISO 8601 format.
      attr_reader :event_start_time
      # @return [String] Title of the event.
      attr_reader :event_title
      # @return [String] Display text for the button.
      attr_reader :title
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param event_description [String] Detailed description for the calendar event.
      # @param event_end_time [String] End time in ISO 8601 format.
      # @param event_start_time [String] Starting time in ISO 8601 format.
      # @param event_title [String] Title of the event.
      # @param title [String] Display text for the button.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RcsButtonScheduleEvent]
      def initialize(event_end_time:, event_start_time:, event_title:, title:, event_description: OMIT,
                     additional_properties: nil)
        @event_description = event_description if event_description != OMIT
        @event_end_time = event_end_time
        @event_start_time = event_start_time
        @event_title = event_title
        @title = title
        @additional_properties = additional_properties
        @_field_set = {
          "eventDescription": event_description,
          "eventEndTime": event_end_time,
          "eventStartTime": event_start_time,
          "eventTitle": event_title,
          "title": title
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RcsButtonScheduleEvent
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RcsButtonScheduleEvent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        event_description = parsed_json["eventDescription"]
        event_end_time = parsed_json["eventEndTime"]
        event_start_time = parsed_json["eventStartTime"]
        event_title = parsed_json["eventTitle"]
        title = parsed_json["title"]
        new(
          event_description: event_description,
          event_end_time: event_end_time,
          event_start_time: event_start_time,
          event_title: event_title,
          title: title,
          additional_properties: struct
        )
      end

      # Serialize an instance of RcsButtonScheduleEvent to a JSON object
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
        obj.event_description&.is_a?(String) != false || raise("Passed value for field obj.event_description is not the expected type, validation failed.")
        obj.event_end_time.is_a?(String) != false || raise("Passed value for field obj.event_end_time is not the expected type, validation failed.")
        obj.event_start_time.is_a?(String) != false || raise("Passed value for field obj.event_start_time is not the expected type, validation failed.")
        obj.event_title.is_a?(String) != false || raise("Passed value for field obj.event_title is not the expected type, validation failed.")
        obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      end
    end
  end
end
