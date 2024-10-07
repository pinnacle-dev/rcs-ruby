# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class CompanyDetails
    # @return [String] The name of the company.
    attr_reader :name
    # @return [String] The address of the company.
    attr_reader :address
    # @return [String] The EIN (Employer Identification Number) of the company.
    attr_reader :ein
    # @return [String] A description of the company.
    attr_reader :description
    # @return [String] The brand color in hex format, must pass a contrast ratio of at least 4.5:1 with
    #  white.
    attr_reader :brand_color
    # @return [String] URL of the company logo.
    attr_reader :logo_url
    # @return [String] URL of the company's hero image.
    attr_reader :hero_url
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The name of the company.
    # @param address [String] The address of the company.
    # @param ein [String] The EIN (Employer Identification Number) of the company.
    # @param description [String] A description of the company.
    # @param brand_color [String] The brand color in hex format, must pass a contrast ratio of at least 4.5:1 with
    #  white.
    # @param logo_url [String] URL of the company logo.
    # @param hero_url [String] URL of the company's hero image.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::CompanyDetails]
    def initialize(name:, address:, ein:, description:, brand_color:, logo_url:, hero_url:, additional_properties: nil)
      @name = name
      @address = address
      @ein = ein
      @description = description
      @brand_color = brand_color
      @logo_url = logo_url
      @hero_url = hero_url
      @additional_properties = additional_properties
      @_field_set = {
        "name": name,
        "address": address,
        "ein": ein,
        "description": description,
        "brandColor": brand_color,
        "logoUrl": logo_url,
        "heroUrl": hero_url
      }
    end

    # Deserialize a JSON object to an instance of CompanyDetails
    #
    # @param json_object [String]
    # @return [Pinnacle::CompanyDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      address = parsed_json["address"]
      ein = parsed_json["ein"]
      description = parsed_json["description"]
      brand_color = parsed_json["brandColor"]
      logo_url = parsed_json["logoUrl"]
      hero_url = parsed_json["heroUrl"]
      new(
        name: name,
        address: address,
        ein: ein,
        description: description,
        brand_color: brand_color,
        logo_url: logo_url,
        hero_url: hero_url,
        additional_properties: struct
      )
    end

    # Serialize an instance of CompanyDetails to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.address.is_a?(String) != false || raise("Passed value for field obj.address is not the expected type, validation failed.")
      obj.ein.is_a?(String) != false || raise("Passed value for field obj.ein is not the expected type, validation failed.")
      obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.brand_color.is_a?(String) != false || raise("Passed value for field obj.brand_color is not the expected type, validation failed.")
      obj.logo_url.is_a?(String) != false || raise("Passed value for field obj.logo_url is not the expected type, validation failed.")
      obj.hero_url.is_a?(String) != false || raise("Passed value for field obj.hero_url is not the expected type, validation failed.")
    end
  end
end
