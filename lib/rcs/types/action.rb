# frozen_string_literal: true

require_relative "action_type"
require_relative "action_lat_long"
require "ostruct"
require "json"

module Pinnacle
  class Action
    # @return [String] Title of the action (must be less than 25 characters).
    attr_reader :title
    # @return [Pinnacle::ActionType] Type of action for the button. 'openUrl' opens a URL, 'call' dials a phone
    #  number, 'trigger' sends the predefined payload to the webhook when pressed,
    #  'requestUserLocation' requests the user's location, 'scheduleEvent' creates a
    #  calendar event, 'sendLocation' sends a location.
    attr_reader :type
    # @return [String] Optional payload associated with the action. This payload encodes the respective
    #  fields for the action type and is required. For 'openUrl', the payload is the
    #  URL to open. For 'call', the payload is the phone number to dial. For 'trigger',
    #  the payload is the predefined payload to send to the webhook.
    attr_reader :payload
    # @return [String] Optional metadata. Only used for type 'trigger' ignored for other action types.
    #  When the user presses the action, the metadata is sent to the webhook alongside
    #  the payload.
    attr_reader :metadata
    # @return [String] Start time for events in ISO 8601 format. For example, '2022-01-01T12:00:00Z'.
    #  Required for 'scheduleEvent'.
    attr_reader :event_start_time
    # @return [String] End time for events in ISO 8601 format. For example, '2022-01-01T12:00:00Z'.
    #  Required for 'scheduleEvent'.
    attr_reader :event_end_time
    # @return [String] Event title. Required for 'scheduleEvent'.
    attr_reader :event_title
    # @return [String] Optional event description.
    attr_reader :event_description
    # @return [Pinnacle::ActionLatLong] Latitude and longitude coordinates. Required for 'sendLocation'.
    attr_reader :lat_long
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param title [String] Title of the action (must be less than 25 characters).
    # @param type [Pinnacle::ActionType] Type of action for the button. 'openUrl' opens a URL, 'call' dials a phone
    #  number, 'trigger' sends the predefined payload to the webhook when pressed,
    #  'requestUserLocation' requests the user's location, 'scheduleEvent' creates a
    #  calendar event, 'sendLocation' sends a location.
    # @param payload [String] Optional payload associated with the action. This payload encodes the respective
    #  fields for the action type and is required. For 'openUrl', the payload is the
    #  URL to open. For 'call', the payload is the phone number to dial. For 'trigger',
    #  the payload is the predefined payload to send to the webhook.
    # @param metadata [String] Optional metadata. Only used for type 'trigger' ignored for other action types.
    #  When the user presses the action, the metadata is sent to the webhook alongside
    #  the payload.
    # @param event_start_time [String] Start time for events in ISO 8601 format. For example, '2022-01-01T12:00:00Z'.
    #  Required for 'scheduleEvent'.
    # @param event_end_time [String] End time for events in ISO 8601 format. For example, '2022-01-01T12:00:00Z'.
    #  Required for 'scheduleEvent'.
    # @param event_title [String] Event title. Required for 'scheduleEvent'.
    # @param event_description [String] Optional event description.
    # @param lat_long [Pinnacle::ActionLatLong] Latitude and longitude coordinates. Required for 'sendLocation'.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::Action]
    def initialize(title: OMIT, type: OMIT, payload: OMIT, metadata: OMIT, event_start_time: OMIT,
                   event_end_time: OMIT, event_title: OMIT, event_description: OMIT, lat_long: OMIT, additional_properties: nil)
      @title = title if title != OMIT
      @type = type if type != OMIT
      @payload = payload if payload != OMIT
      @metadata = metadata if metadata != OMIT
      @event_start_time = event_start_time if event_start_time != OMIT
      @event_end_time = event_end_time if event_end_time != OMIT
      @event_title = event_title if event_title != OMIT
      @event_description = event_description if event_description != OMIT
      @lat_long = lat_long if lat_long != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "title": title,
        "type": type,
        "payload": payload,
        "metadata": metadata,
        "eventStartTime": event_start_time,
        "eventEndTime": event_end_time,
        "eventTitle": event_title,
        "eventDescription": event_description,
        "latLong": lat_long
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
      type = parsed_json["type"]
      payload = parsed_json["payload"]
      metadata = parsed_json["metadata"]
      event_start_time = parsed_json["eventStartTime"]
      event_end_time = parsed_json["eventEndTime"]
      event_title = parsed_json["eventTitle"]
      event_description = parsed_json["eventDescription"]
      if parsed_json["latLong"].nil?
        lat_long = nil
      else
        lat_long = parsed_json["latLong"].to_json
        lat_long = Pinnacle::ActionLatLong.from_json(json_object: lat_long)
      end
      new(
        title: title,
        type: type,
        payload: payload,
        metadata: metadata,
        event_start_time: event_start_time,
        event_end_time: event_end_time,
        event_title: event_title,
        event_description: event_description,
        lat_long: lat_long,
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
      obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      obj.type&.is_a?(Pinnacle::ActionType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.payload&.is_a?(String) != false || raise("Passed value for field obj.payload is not the expected type, validation failed.")
      obj.metadata&.is_a?(String) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
      obj.event_start_time&.is_a?(String) != false || raise("Passed value for field obj.event_start_time is not the expected type, validation failed.")
      obj.event_end_time&.is_a?(String) != false || raise("Passed value for field obj.event_end_time is not the expected type, validation failed.")
      obj.event_title&.is_a?(String) != false || raise("Passed value for field obj.event_title is not the expected type, validation failed.")
      obj.event_description&.is_a?(String) != false || raise("Passed value for field obj.event_description is not the expected type, validation failed.")
      obj.lat_long.nil? || Pinnacle::ActionLatLong.validate_raw(obj: obj.lat_long)
    end
  end
end
