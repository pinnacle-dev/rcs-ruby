# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class CompanyContact
    # @return [String] Primary website URL.
    attr_reader :primary_website_url
    # @return [String] Label for the primary website.
    attr_reader :primary_website_label
    # @return [String] Primary phone number in international format.
    attr_reader :primary_phone
    # @return [String] Label for the primary phone number.
    attr_reader :primary_phone_label
    # @return [String] Primary email address.
    attr_reader :primary_email
    # @return [String] Label for the primary email address.
    attr_reader :primary_email_label
    # @return [String] URL of the privacy policy.
    attr_reader :privacy_policy_url
    # @return [String] URL of the terms of service.
    attr_reader :tos_url
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param primary_website_url [String] Primary website URL.
    # @param primary_website_label [String] Label for the primary website.
    # @param primary_phone [String] Primary phone number in international format.
    # @param primary_phone_label [String] Label for the primary phone number.
    # @param primary_email [String] Primary email address.
    # @param primary_email_label [String] Label for the primary email address.
    # @param privacy_policy_url [String] URL of the privacy policy.
    # @param tos_url [String] URL of the terms of service.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::CompanyContact]
    def initialize(primary_website_url:, primary_website_label:, primary_phone:, primary_phone_label:, primary_email:,
                   primary_email_label:, privacy_policy_url:, tos_url:, additional_properties: nil)
      @primary_website_url = primary_website_url
      @primary_website_label = primary_website_label
      @primary_phone = primary_phone
      @primary_phone_label = primary_phone_label
      @primary_email = primary_email
      @primary_email_label = primary_email_label
      @privacy_policy_url = privacy_policy_url
      @tos_url = tos_url
      @additional_properties = additional_properties
      @_field_set = {
        "primaryWebsiteUrl": primary_website_url,
        "primaryWebsiteLabel": primary_website_label,
        "primaryPhone": primary_phone,
        "primaryPhoneLabel": primary_phone_label,
        "primaryEmail": primary_email,
        "primaryEmailLabel": primary_email_label,
        "privacyPolicyUrl": privacy_policy_url,
        "tosUrl": tos_url
      }
    end

    # Deserialize a JSON object to an instance of CompanyContact
    #
    # @param json_object [String]
    # @return [Pinnacle::CompanyContact]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      primary_website_url = parsed_json["primaryWebsiteUrl"]
      primary_website_label = parsed_json["primaryWebsiteLabel"]
      primary_phone = parsed_json["primaryPhone"]
      primary_phone_label = parsed_json["primaryPhoneLabel"]
      primary_email = parsed_json["primaryEmail"]
      primary_email_label = parsed_json["primaryEmailLabel"]
      privacy_policy_url = parsed_json["privacyPolicyUrl"]
      tos_url = parsed_json["tosUrl"]
      new(
        primary_website_url: primary_website_url,
        primary_website_label: primary_website_label,
        primary_phone: primary_phone,
        primary_phone_label: primary_phone_label,
        primary_email: primary_email,
        primary_email_label: primary_email_label,
        privacy_policy_url: privacy_policy_url,
        tos_url: tos_url,
        additional_properties: struct
      )
    end

    # Serialize an instance of CompanyContact to a JSON object
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
      obj.primary_website_url.is_a?(String) != false || raise("Passed value for field obj.primary_website_url is not the expected type, validation failed.")
      obj.primary_website_label.is_a?(String) != false || raise("Passed value for field obj.primary_website_label is not the expected type, validation failed.")
      obj.primary_phone.is_a?(String) != false || raise("Passed value for field obj.primary_phone is not the expected type, validation failed.")
      obj.primary_phone_label.is_a?(String) != false || raise("Passed value for field obj.primary_phone_label is not the expected type, validation failed.")
      obj.primary_email.is_a?(String) != false || raise("Passed value for field obj.primary_email is not the expected type, validation failed.")
      obj.primary_email_label.is_a?(String) != false || raise("Passed value for field obj.primary_email_label is not the expected type, validation failed.")
      obj.privacy_policy_url.is_a?(String) != false || raise("Passed value for field obj.privacy_policy_url is not the expected type, validation failed.")
      obj.tos_url.is_a?(String) != false || raise("Passed value for field obj.tos_url is not the expected type, validation failed.")
    end
  end
end
