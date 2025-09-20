# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Supported button action types inside the rich cards or quick replies. Each key
    #  is a button action type that defines a specific button type in the Pinnacle API.
    class RcsCapabilityActions
      # @return [Boolean] Buttons that open URLs are supported
      attr_reader :open_url
      # @return [Boolean] Buttons that make phone calls are supported
      attr_reader :call
      # @return [Boolean] Buttons that trigger actions are supported
      attr_reader :trigger
      # @return [Boolean] Buttons that request user location are supported
      attr_reader :request_user_location
      # @return [Boolean] Buttons are supported
      attr_reader :schedule_event
      # @return [Boolean] Buttons that send location are supported
      attr_reader :send_location
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param open_url [Boolean] Buttons that open URLs are supported
      # @param call [Boolean] Buttons that make phone calls are supported
      # @param trigger [Boolean] Buttons that trigger actions are supported
      # @param request_user_location [Boolean] Buttons that request user location are supported
      # @param schedule_event [Boolean] Buttons are supported
      # @param send_location [Boolean] Buttons that send location are supported
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RcsCapabilityActions]
      def initialize(open_url:, call:, trigger:, request_user_location:, schedule_event:, send_location:,
                     additional_properties: nil)
        @open_url = open_url
        @call = call
        @trigger = trigger
        @request_user_location = request_user_location
        @schedule_event = schedule_event
        @send_location = send_location
        @additional_properties = additional_properties
        @_field_set = {
          "openUrl": open_url,
          "call": call,
          "trigger": trigger,
          "requestUserLocation": request_user_location,
          "scheduleEvent": schedule_event,
          "sendLocation": send_location
        }
      end

      # Deserialize a JSON object to an instance of RcsCapabilityActions
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RcsCapabilityActions]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        open_url = parsed_json["openUrl"]
        call = parsed_json["call"]
        trigger = parsed_json["trigger"]
        request_user_location = parsed_json["requestUserLocation"]
        schedule_event = parsed_json["scheduleEvent"]
        send_location = parsed_json["sendLocation"]
        new(
          open_url: open_url,
          call: call,
          trigger: trigger,
          request_user_location: request_user_location,
          schedule_event: schedule_event,
          send_location: send_location,
          additional_properties: struct
        )
      end

      # Serialize an instance of RcsCapabilityActions to a JSON object
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
        obj.open_url.is_a?(Boolean) != false || raise("Passed value for field obj.open_url is not the expected type, validation failed.")
        obj.call.is_a?(Boolean) != false || raise("Passed value for field obj.call is not the expected type, validation failed.")
        obj.trigger.is_a?(Boolean) != false || raise("Passed value for field obj.trigger is not the expected type, validation failed.")
        obj.request_user_location.is_a?(Boolean) != false || raise("Passed value for field obj.request_user_location is not the expected type, validation failed.")
        obj.schedule_event.is_a?(Boolean) != false || raise("Passed value for field obj.schedule_event is not the expected type, validation failed.")
        obj.send_location.is_a?(Boolean) != false || raise("Passed value for field obj.send_location is not the expected type, validation failed.")
      end
    end
  end
end
