# frozen_string_literal: true

require "json"
require_relative "rcs_button_open_url"
require_relative "rcs_button_call"
require_relative "rcs_button_trigger"
require_relative "rcs_button_request_user_location"
require_relative "rcs_button_schedule_event"
require_relative "rcs_button_send_location"

module Pinnacle
  module Types
    class RichButton
      # @return [Object]
      attr_reader :member
      # @return [String]
      attr_reader :discriminant

      private_class_method :new
      alias kind_of? is_a?

      # @param member [Object]
      # @param discriminant [String]
      # @return [Pinnacle::Types::RichButton]
      def initialize(member:, discriminant:)
        @member = member
        @discriminant = discriminant
      end

      # Deserialize a JSON object to an instance of RichButton
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RichButton]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        member = case struct.type
                 when "openUrl"
                   Pinnacle::Types::RcsButtonOpenUrl.from_json(json_object: json_object)
                 when "call"
                   Pinnacle::Types::RcsButtonCall.from_json(json_object: json_object)
                 when "trigger"
                   Pinnacle::Types::RcsButtonTrigger.from_json(json_object: json_object)
                 when "requestUserLocation"
                   Pinnacle::Types::RcsButtonRequestUserLocation.from_json(json_object: json_object)
                 when "scheduleEvent"
                   Pinnacle::Types::RcsButtonScheduleEvent.from_json(json_object: json_object)
                 when "sendLocation"
                   Pinnacle::Types::RcsButtonSendLocation.from_json(json_object: json_object)
                 else
                   Pinnacle::Types::RcsButtonOpenUrl.from_json(json_object: json_object)
                 end
        new(member: member, discriminant: struct.type)
      end

      # For Union Types, to_json functionality is delegated to the wrapped member.
      #
      # @return [String]
      def to_json(*_args)
        case @discriminant
        when "openUrl"
          { **@member.to_json, type: @discriminant }.to_json
        when "call"
          { **@member.to_json, type: @discriminant }.to_json
        when "trigger"
          { **@member.to_json, type: @discriminant }.to_json
        when "requestUserLocation"
          { **@member.to_json, type: @discriminant }.to_json
        when "scheduleEvent"
          { **@member.to_json, type: @discriminant }.to_json
        when "sendLocation"
          { **@member.to_json, type: @discriminant }.to_json
        else
          { "type": @discriminant, value: @member }.to_json
        end
        @member.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        case obj.type
        when "openUrl"
          Pinnacle::Types::RcsButtonOpenUrl.validate_raw(obj: obj)
        when "call"
          Pinnacle::Types::RcsButtonCall.validate_raw(obj: obj)
        when "trigger"
          Pinnacle::Types::RcsButtonTrigger.validate_raw(obj: obj)
        when "requestUserLocation"
          Pinnacle::Types::RcsButtonRequestUserLocation.validate_raw(obj: obj)
        when "scheduleEvent"
          Pinnacle::Types::RcsButtonScheduleEvent.validate_raw(obj: obj)
        when "sendLocation"
          Pinnacle::Types::RcsButtonSendLocation.validate_raw(obj: obj)
        else
          raise("Passed value matched no type within the union, validation failed.")
        end
      end

      # For Union Types, is_a? functionality is delegated to the wrapped member.
      #
      # @param obj [Object]
      # @return [Boolean]
      def is_a?(obj)
        @member.is_a?(obj)
      end

      # @param member [Pinnacle::Types::RcsButtonOpenUrl]
      # @return [Pinnacle::Types::RichButton]
      def self.open_url(member:)
        new(member: member, discriminant: "openUrl")
      end

      # @param member [Pinnacle::Types::RcsButtonCall]
      # @return [Pinnacle::Types::RichButton]
      def self.call(member:)
        new(member: member, discriminant: "call")
      end

      # @param member [Pinnacle::Types::RcsButtonTrigger]
      # @return [Pinnacle::Types::RichButton]
      def self.trigger(member:)
        new(member: member, discriminant: "trigger")
      end

      # @param member [Pinnacle::Types::RcsButtonRequestUserLocation]
      # @return [Pinnacle::Types::RichButton]
      def self.request_user_location(member:)
        new(member: member, discriminant: "requestUserLocation")
      end

      # @param member [Pinnacle::Types::RcsButtonScheduleEvent]
      # @return [Pinnacle::Types::RichButton]
      def self.schedule_event(member:)
        new(member: member, discriminant: "scheduleEvent")
      end

      # @param member [Pinnacle::Types::RcsButtonSendLocation]
      # @return [Pinnacle::Types::RichButton]
      def self.send_location(member:)
        new(member: member, discriminant: "sendLocation")
      end
    end
  end
end
