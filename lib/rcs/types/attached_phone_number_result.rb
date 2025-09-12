# frozen_string_literal: true

require_relative "phone_number_campaign_attach_phone_numbers_item"
require_relative "phone_number_campaign_attach_failed_item"
require "ostruct"
require "json"

module Pinnacle
  class AttachedPhoneNumberResult
    # @return [Array<Pinnacle::PhoneNumberCampaignAttachPhoneNumbersItem>] List of phone numbers.
    attr_reader :phone_numbers
    # @return [Array<Pinnacle::PhoneNumberCampaignAttachFailedItem>] List of numbers that were not failed to be attached.
    attr_reader :failed
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param phone_numbers [Array<Pinnacle::PhoneNumberCampaignAttachPhoneNumbersItem>] List of phone numbers.
    # @param failed [Array<Pinnacle::PhoneNumberCampaignAttachFailedItem>] List of numbers that were not failed to be attached.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::AttachedPhoneNumberResult]
    def initialize(phone_numbers:, failed:, additional_properties: nil)
      @phone_numbers = phone_numbers
      @failed = failed
      @additional_properties = additional_properties
      @_field_set = { "phoneNumbers": phone_numbers, "failed": failed }
    end

    # Deserialize a JSON object to an instance of AttachedPhoneNumberResult
    #
    # @param json_object [String]
    # @return [Pinnacle::AttachedPhoneNumberResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      phone_numbers = parsed_json["phoneNumbers"]&.map do |item|
        item = item.to_json
        Pinnacle::PhoneNumberCampaignAttachPhoneNumbersItem.from_json(json_object: item)
      end
      failed = parsed_json["failed"]&.map do |item|
        item = item.to_json
        Pinnacle::PhoneNumberCampaignAttachFailedItem.from_json(json_object: item)
      end
      new(
        phone_numbers: phone_numbers,
        failed: failed,
        additional_properties: struct
      )
    end

    # Serialize an instance of AttachedPhoneNumberResult to a JSON object
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
      obj.phone_numbers.is_a?(Array) != false || raise("Passed value for field obj.phone_numbers is not the expected type, validation failed.")
      obj.failed.is_a?(Array) != false || raise("Passed value for field obj.failed is not the expected type, validation failed.")
    end
  end
end
