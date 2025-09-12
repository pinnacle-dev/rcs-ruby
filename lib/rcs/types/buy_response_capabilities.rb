# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  # Enabled communication features for the phone number.
  class BuyResponseCapabilities
    # @return [Boolean] Indicates if SMS messaging is enabled and functional.
    attr_reader :sms
    # @return [Boolean] Indicates if multimedia messaging (images, videos, files) is enabled and
    #  functional.
    attr_reader :mms
    # @return [Boolean] Indicates if voice calling is enabled and functional.
    attr_reader :voice
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param sms [Boolean] Indicates if SMS messaging is enabled and functional.
    # @param mms [Boolean] Indicates if multimedia messaging (images, videos, files) is enabled and
    #  functional.
    # @param voice [Boolean] Indicates if voice calling is enabled and functional.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::BuyResponseCapabilities]
    def initialize(sms:, mms:, voice:, additional_properties: nil)
      @sms = sms
      @mms = mms
      @voice = voice
      @additional_properties = additional_properties
      @_field_set = { "sms": sms, "mms": mms, "voice": voice }
    end

    # Deserialize a JSON object to an instance of BuyResponseCapabilities
    #
    # @param json_object [String]
    # @return [Pinnacle::BuyResponseCapabilities]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      sms = parsed_json["sms"]
      mms = parsed_json["mms"]
      voice = parsed_json["voice"]
      new(
        sms: sms,
        mms: mms,
        voice: voice,
        additional_properties: struct
      )
    end

    # Serialize an instance of BuyResponseCapabilities to a JSON object
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
      obj.sms.is_a?(Boolean) != false || raise("Passed value for field obj.sms is not the expected type, validation failed.")
      obj.mms.is_a?(Boolean) != false || raise("Passed value for field obj.mms is not the expected type, validation failed.")
      obj.voice.is_a?(Boolean) != false || raise("Passed value for field obj.voice is not the expected type, validation failed.")
    end
  end
end
