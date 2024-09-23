# frozen_string_literal: true

require_relative "action_action_type"
require "ostruct"
require "json"

module Pinnacle
  class Action
    # @return [String]
    attr_reader :title
    # @return [Pinnacle::ActionActionType]
    attr_reader :action_type
    # @return [String]
    attr_reader :payload
    # @return [String]
    attr_reader :execute
    # @return [String]
    attr_reader :start_time
    # @return [String]
    attr_reader :end_time
    # @return [String]
    attr_reader :event_title
    # @return [String]
    attr_reader :event_description
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param title [String]
    # @param action_type [Pinnacle::ActionActionType]
    # @param payload [String]
    # @param execute [String]
    # @param start_time [String]
    # @param end_time [String]
    # @param event_title [String]
    # @param event_description [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::Action]
    def initialize(title:, action_type:, payload: OMIT, execute: OMIT, start_time: OMIT, end_time: OMIT,
                   event_title: OMIT, event_description: OMIT, additional_properties: nil)
      @title = title
      @action_type = action_type
      @payload = payload if payload != OMIT
      @execute = execute if execute != OMIT
      @start_time = start_time if start_time != OMIT
      @end_time = end_time if end_time != OMIT
      @event_title = event_title if event_title != OMIT
      @event_description = event_description if event_description != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "title": title,
        "action_type": action_type,
        "payload": payload,
        "execute": execute,
        "start_time": start_time,
        "end_time": end_time,
        "event_title": event_title,
        "event_description": event_description
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Action
    #
    # @param json_object [String]
    # @return [Pinnacle::Action]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      title = parsed_json["title"]
      action_type = parsed_json["action_type"]
      payload = parsed_json["payload"]
      execute = parsed_json["execute"]
      start_time = parsed_json["start_time"]
      end_time = parsed_json["end_time"]
      event_title = parsed_json["event_title"]
      event_description = parsed_json["event_description"]
      new(
        title: title,
        action_type: action_type,
        payload: payload,
        execute: execute,
        start_time: start_time,
        end_time: end_time,
        event_title: event_title,
        event_description: event_description,
        additional_properties: struct
      )
    end

    # Serialize an instance of Action to a JSON object
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
      obj.action_type.is_a?(Pinnacle::ActionActionType) != false || raise("Passed value for field obj.action_type is not the expected type, validation failed.")
      obj.payload&.is_a?(String) != false || raise("Passed value for field obj.payload is not the expected type, validation failed.")
      obj.execute&.is_a?(String) != false || raise("Passed value for field obj.execute is not the expected type, validation failed.")
      obj.start_time&.is_a?(String) != false || raise("Passed value for field obj.start_time is not the expected type, validation failed.")
      obj.end_time&.is_a?(String) != false || raise("Passed value for field obj.end_time is not the expected type, validation failed.")
      obj.event_title&.is_a?(String) != false || raise("Passed value for field obj.event_title is not the expected type, validation failed.")
      obj.event_description&.is_a?(String) != false || raise("Passed value for field obj.event_description is not the expected type, validation failed.")
    end
  end
end
