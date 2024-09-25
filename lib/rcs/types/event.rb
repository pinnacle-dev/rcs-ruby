# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module Pinnacle
  class Event
    # @return [String] The title for the event action. Maximum length is 25 characters.
    attr_reader :title
    # @return [String] The type of message being sent
    attr_reader :action_type
    # @return [DateTime] The start time for the event.
    attr_reader :start_time
    # @return [DateTime] The end time for the event.
    attr_reader :end_time
    # @return [String] The title of the event.
    attr_reader :event_title
    # @return [String] The description of the event
    attr_reader :event_description
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param title [String] The title for the event action. Maximum length is 25 characters.
    # @param action_type [String] The type of message being sent
    # @param start_time [DateTime] The start time for the event.
    # @param end_time [DateTime] The end time for the event.
    # @param event_title [String] The title of the event.
    # @param event_description [String] The description of the event
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::Event]
    def initialize(title:, action_type:, start_time:, end_time:, event_title:, event_description: OMIT,
                   additional_properties: nil)
      @title = title
      @action_type = action_type
      @start_time = start_time
      @end_time = end_time
      @event_title = event_title
      @event_description = event_description if event_description != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "title": title,
        "action_type": action_type,
        "start_time": start_time,
        "end_time": end_time,
        "event_title": event_title,
        "event_description": event_description
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Event
    #
    # @param json_object [String]
    # @return [Pinnacle::Event]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      title = parsed_json["title"]
      action_type = parsed_json["action_type"]
      start_time = (DateTime.parse(parsed_json["start_time"]) unless parsed_json["start_time"].nil?)
      end_time = (DateTime.parse(parsed_json["end_time"]) unless parsed_json["end_time"].nil?)
      event_title = parsed_json["event_title"]
      event_description = parsed_json["event_description"]
      new(
        title: title,
        action_type: action_type,
        start_time: start_time,
        end_time: end_time,
        event_title: event_title,
        event_description: event_description,
        additional_properties: struct
      )
    end

    # Serialize an instance of Event to a JSON object
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
      obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      obj.action_type.is_a?(String) != false || raise("Passed value for field obj.action_type is not the expected type, validation failed.")
      obj.start_time.is_a?(DateTime) != false || raise("Passed value for field obj.start_time is not the expected type, validation failed.")
      obj.end_time.is_a?(DateTime) != false || raise("Passed value for field obj.end_time is not the expected type, validation failed.")
      obj.event_title.is_a?(String) != false || raise("Passed value for field obj.event_title is not the expected type, validation failed.")
      obj.event_description&.is_a?(String) != false || raise("Passed value for field obj.event_description is not the expected type, validation failed.")
    end
  end
end
