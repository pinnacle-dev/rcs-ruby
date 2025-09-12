# frozen_string_literal: true

require_relative "phone_number_campaign_detach_phone_numbers_item_campaign"
require "ostruct"
require "json"

module Pinnacle
  class PhoneNumberCampaignDetachPhoneNumbersItem
    # @return [String] Phone number (E.164 format).
    attr_reader :phone_number
    # @return [Pinnacle::PhoneNumberCampaignDetachPhoneNumbersItemCampaign] Campaign that the phone is now detached from.
    attr_reader :campaign
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param phone_number [String] Phone number (E.164 format).
    # @param campaign [Pinnacle::PhoneNumberCampaignDetachPhoneNumbersItemCampaign] Campaign that the phone is now detached from.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::PhoneNumberCampaignDetachPhoneNumbersItem]
    def initialize(phone_number:, campaign:, additional_properties: nil)
      @phone_number = phone_number
      @campaign = campaign
      @additional_properties = additional_properties
      @_field_set = { "phoneNumber": phone_number, "campaign": campaign }
    end

    # Deserialize a JSON object to an instance of
    #  PhoneNumberCampaignDetachPhoneNumbersItem
    #
    # @param json_object [String]
    # @return [Pinnacle::PhoneNumberCampaignDetachPhoneNumbersItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      phone_number = parsed_json["phoneNumber"]
      if parsed_json["campaign"].nil?
        campaign = nil
      else
        campaign = parsed_json["campaign"].to_json
        campaign = Pinnacle::PhoneNumberCampaignDetachPhoneNumbersItemCampaign.from_json(json_object: campaign)
      end
      new(
        phone_number: phone_number,
        campaign: campaign,
        additional_properties: struct
      )
    end

    # Serialize an instance of PhoneNumberCampaignDetachPhoneNumbersItem to a JSON
    #  object
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
      obj.phone_number.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
      Pinnacle::PhoneNumberCampaignDetachPhoneNumbersItemCampaign.validate_raw(obj: obj.campaign)
    end
  end
end
