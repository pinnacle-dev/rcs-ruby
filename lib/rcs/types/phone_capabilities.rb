# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Represents the communication capabilities available for a phone number.
    class PhoneCapabilities
      # @return [Boolean] Whether the phone number supports MMS (multimedia messaging).
      attr_reader :mms
      # @return [Boolean] Whether the phone number supports SMS messaging.
      attr_reader :sms
      # @return [Boolean] Whether the phone number supports voice calls.
      attr_reader :voice
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param mms [Boolean] Whether the phone number supports MMS (multimedia messaging).
      # @param sms [Boolean] Whether the phone number supports SMS messaging.
      # @param voice [Boolean] Whether the phone number supports voice calls.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::PhoneCapabilities]
      def initialize(mms:, sms:, voice:, additional_properties: nil)
        @mms = mms
        @sms = sms
        @voice = voice
        @additional_properties = additional_properties
        @_field_set = { "mms": mms, "sms": sms, "voice": voice }
      end

      # Deserialize a JSON object to an instance of PhoneCapabilities
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::PhoneCapabilities]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        mms = parsed_json["mms"]
        sms = parsed_json["sms"]
        voice = parsed_json["voice"]
        new(
          mms: mms,
          sms: sms,
          voice: voice,
          additional_properties: struct
        )
      end

      # Serialize an instance of PhoneCapabilities to a JSON object
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
        obj.mms.is_a?(Boolean) != false || raise("Passed value for field obj.mms is not the expected type, validation failed.")
        obj.sms.is_a?(Boolean) != false || raise("Passed value for field obj.sms is not the expected type, validation failed.")
        obj.voice.is_a?(Boolean) != false || raise("Passed value for field obj.voice is not the expected type, validation failed.")
      end
    end
  end
end
