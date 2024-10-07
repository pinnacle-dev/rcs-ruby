# frozen_string_literal: true

require_relative "additional_website"
require_relative "additional_phone_number"
require_relative "additional_email"
require "ostruct"
require "json"

module Pinnacle
  class Optionals
    # @return [Array<Pinnacle::AdditionalWebsite>] List of additional websites, up to 2.
    attr_reader :additional_websites
    # @return [Array<Pinnacle::AdditionalPhoneNumber>] List of additional phone numbers, up to 2.
    attr_reader :additional_phone_numbers
    # @return [Array<Pinnacle::AdditionalEmail>] List of additional email addresses, up to 2.
    attr_reader :additional_emails
    # @return [Array<String>]
    attr_reader :test_numbers
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param additional_websites [Array<Pinnacle::AdditionalWebsite>] List of additional websites, up to 2.
    # @param additional_phone_numbers [Array<Pinnacle::AdditionalPhoneNumber>] List of additional phone numbers, up to 2.
    # @param additional_emails [Array<Pinnacle::AdditionalEmail>] List of additional email addresses, up to 2.
    # @param test_numbers [Array<String>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::Optionals]
    def initialize(additional_websites: OMIT, additional_phone_numbers: OMIT, additional_emails: OMIT,
                   test_numbers: OMIT, additional_properties: nil)
      @additional_websites = additional_websites if additional_websites != OMIT
      @additional_phone_numbers = additional_phone_numbers if additional_phone_numbers != OMIT
      @additional_emails = additional_emails if additional_emails != OMIT
      @test_numbers = test_numbers if test_numbers != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "additionalWebsites": additional_websites,
        "additionalPhoneNumbers": additional_phone_numbers,
        "additionalEmails": additional_emails,
        "testNumbers": test_numbers
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Optionals
    #
    # @param json_object [String]
    # @return [Pinnacle::Optionals]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      additional_websites = parsed_json["additionalWebsites"]&.map do |item|
        item = item.to_json
        Pinnacle::AdditionalWebsite.from_json(json_object: item)
      end
      additional_phone_numbers = parsed_json["additionalPhoneNumbers"]&.map do |item|
        item = item.to_json
        Pinnacle::AdditionalPhoneNumber.from_json(json_object: item)
      end
      additional_emails = parsed_json["additionalEmails"]&.map do |item|
        item = item.to_json
        Pinnacle::AdditionalEmail.from_json(json_object: item)
      end
      test_numbers = parsed_json["testNumbers"]
      new(
        additional_websites: additional_websites,
        additional_phone_numbers: additional_phone_numbers,
        additional_emails: additional_emails,
        test_numbers: test_numbers,
        additional_properties: struct
      )
    end

    # Serialize an instance of Optionals to a JSON object
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
      obj.additional_websites&.is_a?(Array) != false || raise("Passed value for field obj.additional_websites is not the expected type, validation failed.")
      obj.additional_phone_numbers&.is_a?(Array) != false || raise("Passed value for field obj.additional_phone_numbers is not the expected type, validation failed.")
      obj.additional_emails&.is_a?(Array) != false || raise("Passed value for field obj.additional_emails is not the expected type, validation failed.")
      obj.test_numbers&.is_a?(Array) != false || raise("Passed value for field obj.test_numbers is not the expected type, validation failed.")
    end
  end
end
