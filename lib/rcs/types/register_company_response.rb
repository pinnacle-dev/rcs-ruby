# frozen_string_literal: true

require_relative "register_company_response_brand"
require "ostruct"
require "json"

module Pinnacle
  class RegisterCompanyResponse
    # @return [Pinnacle::RegisterCompanyResponseBrand]
    attr_reader :brand
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param brand [Pinnacle::RegisterCompanyResponseBrand]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::RegisterCompanyResponse]
    def initialize(brand:, additional_properties: nil)
      @brand = brand
      @additional_properties = additional_properties
      @_field_set = { "brand": brand }
    end

    # Deserialize a JSON object to an instance of RegisterCompanyResponse
    #
    # @param json_object [String]
    # @return [Pinnacle::RegisterCompanyResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["brand"].nil?
        brand = nil
      else
        brand = parsed_json["brand"].to_json
        brand = Pinnacle::RegisterCompanyResponseBrand.from_json(json_object: brand)
      end
      new(brand: brand, additional_properties: struct)
    end

    # Serialize an instance of RegisterCompanyResponse to a JSON object
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
      Pinnacle::RegisterCompanyResponseBrand.validate_raw(obj: obj.brand)
    end
  end
end
