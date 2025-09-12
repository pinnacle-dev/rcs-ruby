# frozen_string_literal: true

require_relative "sms_validation_response_segments_gsm_7"
require_relative "sms_validation_response_segments_utf_16"
require "ostruct"
require "json"

module Pinnacle
  # Details about how the SMS content would be segmented for delivery.
  class SmsValidationResponseSegments
    # @return [Pinnacle::SmsValidationResponseSegmentsGsm7] Segmentation details when your message is encoded with GSM-7.
    attr_reader :gsm_7
    # @return [Pinnacle::SmsValidationResponseSegmentsUtf16] Segmentation details when your message is encoded with UTF-16.
    attr_reader :utf_16
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param gsm_7 [Pinnacle::SmsValidationResponseSegmentsGsm7] Segmentation details when your message is encoded with GSM-7.
    # @param utf_16 [Pinnacle::SmsValidationResponseSegmentsUtf16] Segmentation details when your message is encoded with UTF-16.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::SmsValidationResponseSegments]
    def initialize(gsm_7:, utf_16:, additional_properties: nil)
      @gsm_7 = gsm_7
      @utf_16 = utf_16
      @additional_properties = additional_properties
      @_field_set = { "gsm7": gsm_7, "utf16": utf_16 }
    end

    # Deserialize a JSON object to an instance of SmsValidationResponseSegments
    #
    # @param json_object [String]
    # @return [Pinnacle::SmsValidationResponseSegments]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["gsm7"].nil?
        gsm_7 = nil
      else
        gsm_7 = parsed_json["gsm7"].to_json
        gsm_7 = Pinnacle::SmsValidationResponseSegmentsGsm7.from_json(json_object: gsm_7)
      end
      if parsed_json["utf16"].nil?
        utf_16 = nil
      else
        utf_16 = parsed_json["utf16"].to_json
        utf_16 = Pinnacle::SmsValidationResponseSegmentsUtf16.from_json(json_object: utf_16)
      end
      new(
        gsm_7: gsm_7,
        utf_16: utf_16,
        additional_properties: struct
      )
    end

    # Serialize an instance of SmsValidationResponseSegments to a JSON object
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
      Pinnacle::SmsValidationResponseSegmentsGsm7.validate_raw(obj: obj.gsm_7)
      Pinnacle::SmsValidationResponseSegmentsUtf16.validate_raw(obj: obj.utf_16)
    end
  end
end
