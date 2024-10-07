# frozen_string_literal: true

require "date"
require_relative "company_additional_websites_item"
require_relative "company_additional_emails_item"
require_relative "company_additional_phone_numbers_item"
require "ostruct"
require "json"

module Pinnacle
  class Company
    # @return [Integer] The unique identifier for the company
    attr_reader :id
    # @return [DateTime] The date and time when the company was created
    attr_reader :created_at
    # @return [String] The name of the company
    attr_reader :name
    # @return [String] The address of the company
    attr_reader :address
    # @return [String] The Employer Identification Number (EIN) of the company
    attr_reader :ein
    # @return [String] A description of the company
    attr_reader :description
    # @return [String] The brand color of the company
    attr_reader :brand_color
    # @return [String] The URL of the company's logo
    attr_reader :logo_url
    # @return [String] The URL of the company's hero image
    attr_reader :hero_url
    # @return [String] The primary website URL of the company
    attr_reader :primary_website_url
    # @return [String] The label for the primary website URL
    attr_reader :primary_website_label
    # @return [String] The primary phone number of the company
    attr_reader :primary_phone
    # @return [String] The label for the primary phone number
    attr_reader :primary_phone_label
    # @return [String] The primary email address of the company
    attr_reader :primary_email
    # @return [String] The label for the primary email address
    attr_reader :primary_email_label
    # @return [String] The URL of the company's privacy policy
    attr_reader :privacy_policy_url
    # @return [String] The URL of the company's terms of service
    attr_reader :tos_url
    # @return [String] The name of the point of contact
    attr_reader :poc_name
    # @return [String] The title of the point of contact
    attr_reader :poc_title
    # @return [String] The email address of the point of contact
    attr_reader :poc_email
    # @return [Array<String>] A list of test phone numbers
    attr_reader :test_numbers
    # @return [String] The approval status of the company
    attr_reader :status
    # @return [Array<Pinnacle::CompanyAdditionalWebsitesItem>] A list of additional websites
    attr_reader :additional_websites
    # @return [Array<Pinnacle::CompanyAdditionalEmailsItem>] A list of additional email addresses
    attr_reader :additional_emails
    # @return [Array<Pinnacle::CompanyAdditionalPhoneNumbersItem>] A list of additional phone numbers
    attr_reader :additional_phone_numbers
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [Integer] The unique identifier for the company
    # @param created_at [DateTime] The date and time when the company was created
    # @param name [String] The name of the company
    # @param address [String] The address of the company
    # @param ein [String] The Employer Identification Number (EIN) of the company
    # @param description [String] A description of the company
    # @param brand_color [String] The brand color of the company
    # @param logo_url [String] The URL of the company's logo
    # @param hero_url [String] The URL of the company's hero image
    # @param primary_website_url [String] The primary website URL of the company
    # @param primary_website_label [String] The label for the primary website URL
    # @param primary_phone [String] The primary phone number of the company
    # @param primary_phone_label [String] The label for the primary phone number
    # @param primary_email [String] The primary email address of the company
    # @param primary_email_label [String] The label for the primary email address
    # @param privacy_policy_url [String] The URL of the company's privacy policy
    # @param tos_url [String] The URL of the company's terms of service
    # @param poc_name [String] The name of the point of contact
    # @param poc_title [String] The title of the point of contact
    # @param poc_email [String] The email address of the point of contact
    # @param test_numbers [Array<String>] A list of test phone numbers
    # @param status [String] The approval status of the company
    # @param additional_websites [Array<Pinnacle::CompanyAdditionalWebsitesItem>] A list of additional websites
    # @param additional_emails [Array<Pinnacle::CompanyAdditionalEmailsItem>] A list of additional email addresses
    # @param additional_phone_numbers [Array<Pinnacle::CompanyAdditionalPhoneNumbersItem>] A list of additional phone numbers
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::Company]
    def initialize(id: OMIT, created_at: OMIT, name: OMIT, address: OMIT, ein: OMIT, description: OMIT,
                   brand_color: OMIT, logo_url: OMIT, hero_url: OMIT, primary_website_url: OMIT, primary_website_label: OMIT, primary_phone: OMIT, primary_phone_label: OMIT, primary_email: OMIT, primary_email_label: OMIT, privacy_policy_url: OMIT, tos_url: OMIT, poc_name: OMIT, poc_title: OMIT, poc_email: OMIT, test_numbers: OMIT, status: OMIT, additional_websites: OMIT, additional_emails: OMIT, additional_phone_numbers: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @created_at = created_at if created_at != OMIT
      @name = name if name != OMIT
      @address = address if address != OMIT
      @ein = ein if ein != OMIT
      @description = description if description != OMIT
      @brand_color = brand_color if brand_color != OMIT
      @logo_url = logo_url if logo_url != OMIT
      @hero_url = hero_url if hero_url != OMIT
      @primary_website_url = primary_website_url if primary_website_url != OMIT
      @primary_website_label = primary_website_label if primary_website_label != OMIT
      @primary_phone = primary_phone if primary_phone != OMIT
      @primary_phone_label = primary_phone_label if primary_phone_label != OMIT
      @primary_email = primary_email if primary_email != OMIT
      @primary_email_label = primary_email_label if primary_email_label != OMIT
      @privacy_policy_url = privacy_policy_url if privacy_policy_url != OMIT
      @tos_url = tos_url if tos_url != OMIT
      @poc_name = poc_name if poc_name != OMIT
      @poc_title = poc_title if poc_title != OMIT
      @poc_email = poc_email if poc_email != OMIT
      @test_numbers = test_numbers if test_numbers != OMIT
      @status = status if status != OMIT
      @additional_websites = additional_websites if additional_websites != OMIT
      @additional_emails = additional_emails if additional_emails != OMIT
      @additional_phone_numbers = additional_phone_numbers if additional_phone_numbers != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "createdAt": created_at,
        "name": name,
        "address": address,
        "ein": ein,
        "description": description,
        "brandColor": brand_color,
        "logoUrl": logo_url,
        "heroUrl": hero_url,
        "primaryWebsiteUrl": primary_website_url,
        "primaryWebsiteLabel": primary_website_label,
        "primaryPhone": primary_phone,
        "primaryPhoneLabel": primary_phone_label,
        "primaryEmail": primary_email,
        "primaryEmailLabel": primary_email_label,
        "privacyPolicyUrl": privacy_policy_url,
        "tosUrl": tos_url,
        "pocName": poc_name,
        "pocTitle": poc_title,
        "pocEmail": poc_email,
        "testNumbers": test_numbers,
        "status": status,
        "additionalWebsites": additional_websites,
        "additionalEmails": additional_emails,
        "additionalPhoneNumbers": additional_phone_numbers
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Company
    #
    # @param json_object [String]
    # @return [Pinnacle::Company]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      name = parsed_json["name"]
      address = parsed_json["address"]
      ein = parsed_json["ein"]
      description = parsed_json["description"]
      brand_color = parsed_json["brandColor"]
      logo_url = parsed_json["logoUrl"]
      hero_url = parsed_json["heroUrl"]
      primary_website_url = parsed_json["primaryWebsiteUrl"]
      primary_website_label = parsed_json["primaryWebsiteLabel"]
      primary_phone = parsed_json["primaryPhone"]
      primary_phone_label = parsed_json["primaryPhoneLabel"]
      primary_email = parsed_json["primaryEmail"]
      primary_email_label = parsed_json["primaryEmailLabel"]
      privacy_policy_url = parsed_json["privacyPolicyUrl"]
      tos_url = parsed_json["tosUrl"]
      poc_name = parsed_json["pocName"]
      poc_title = parsed_json["pocTitle"]
      poc_email = parsed_json["pocEmail"]
      test_numbers = parsed_json["testNumbers"]
      status = parsed_json["status"]
      additional_websites = parsed_json["additionalWebsites"]&.map do |item|
        item = item.to_json
        Pinnacle::CompanyAdditionalWebsitesItem.from_json(json_object: item)
      end
      additional_emails = parsed_json["additionalEmails"]&.map do |item|
        item = item.to_json
        Pinnacle::CompanyAdditionalEmailsItem.from_json(json_object: item)
      end
      additional_phone_numbers = parsed_json["additionalPhoneNumbers"]&.map do |item|
        item = item.to_json
        Pinnacle::CompanyAdditionalPhoneNumbersItem.from_json(json_object: item)
      end
      new(
        id: id,
        created_at: created_at,
        name: name,
        address: address,
        ein: ein,
        description: description,
        brand_color: brand_color,
        logo_url: logo_url,
        hero_url: hero_url,
        primary_website_url: primary_website_url,
        primary_website_label: primary_website_label,
        primary_phone: primary_phone,
        primary_phone_label: primary_phone_label,
        primary_email: primary_email,
        primary_email_label: primary_email_label,
        privacy_policy_url: privacy_policy_url,
        tos_url: tos_url,
        poc_name: poc_name,
        poc_title: poc_title,
        poc_email: poc_email,
        test_numbers: test_numbers,
        status: status,
        additional_websites: additional_websites,
        additional_emails: additional_emails,
        additional_phone_numbers: additional_phone_numbers,
        additional_properties: struct
      )
    end

    # Serialize an instance of Company to a JSON object
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
      obj.id&.is_a?(Integer) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.address&.is_a?(String) != false || raise("Passed value for field obj.address is not the expected type, validation failed.")
      obj.ein&.is_a?(String) != false || raise("Passed value for field obj.ein is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.brand_color&.is_a?(String) != false || raise("Passed value for field obj.brand_color is not the expected type, validation failed.")
      obj.logo_url&.is_a?(String) != false || raise("Passed value for field obj.logo_url is not the expected type, validation failed.")
      obj.hero_url&.is_a?(String) != false || raise("Passed value for field obj.hero_url is not the expected type, validation failed.")
      obj.primary_website_url&.is_a?(String) != false || raise("Passed value for field obj.primary_website_url is not the expected type, validation failed.")
      obj.primary_website_label&.is_a?(String) != false || raise("Passed value for field obj.primary_website_label is not the expected type, validation failed.")
      obj.primary_phone&.is_a?(String) != false || raise("Passed value for field obj.primary_phone is not the expected type, validation failed.")
      obj.primary_phone_label&.is_a?(String) != false || raise("Passed value for field obj.primary_phone_label is not the expected type, validation failed.")
      obj.primary_email&.is_a?(String) != false || raise("Passed value for field obj.primary_email is not the expected type, validation failed.")
      obj.primary_email_label&.is_a?(String) != false || raise("Passed value for field obj.primary_email_label is not the expected type, validation failed.")
      obj.privacy_policy_url&.is_a?(String) != false || raise("Passed value for field obj.privacy_policy_url is not the expected type, validation failed.")
      obj.tos_url&.is_a?(String) != false || raise("Passed value for field obj.tos_url is not the expected type, validation failed.")
      obj.poc_name&.is_a?(String) != false || raise("Passed value for field obj.poc_name is not the expected type, validation failed.")
      obj.poc_title&.is_a?(String) != false || raise("Passed value for field obj.poc_title is not the expected type, validation failed.")
      obj.poc_email&.is_a?(String) != false || raise("Passed value for field obj.poc_email is not the expected type, validation failed.")
      obj.test_numbers&.is_a?(Array) != false || raise("Passed value for field obj.test_numbers is not the expected type, validation failed.")
      obj.status&.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.additional_websites&.is_a?(Array) != false || raise("Passed value for field obj.additional_websites is not the expected type, validation failed.")
      obj.additional_emails&.is_a?(Array) != false || raise("Passed value for field obj.additional_emails is not the expected type, validation failed.")
      obj.additional_phone_numbers&.is_a?(Array) != false || raise("Passed value for field obj.additional_phone_numbers is not the expected type, validation failed.")
    end
  end
end
