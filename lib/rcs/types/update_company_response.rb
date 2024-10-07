# frozen_string_literal: true

require_relative "update_company_response_brand"
require "ostruct"
require "json"

module Pinnacle
  class UpdateCompanyResponse
    # @return [Boolean]
    attr_reader :success
    # @return [Pinnacle::UpdateCompanyResponseBrand]
    attr_reader :brand
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param success [Boolean]
    # @param brand [Pinnacle::UpdateCompanyResponseBrand]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::UpdateCompanyResponse]
    def initialize(success: OMIT, brand: OMIT, additional_properties: nil)
      @success = success if success != OMIT
      @brand = brand if brand != OMIT
      @additional_properties = additional_properties
      @_field_set = { "success": success, "brand": brand }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of UpdateCompanyResponse
    #
    # @param json_object [String]
    # @return [Pinnacle::UpdateCompanyResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      success = parsed_json["success"]
      if parsed_json["brand"].nil?
        brand = nil
      else
        brand = parsed_json["brand"].to_json
        brand = Pinnacle::UpdateCompanyResponseBrand.from_json(json_object: brand)
      end
      new(
        success: success,
        brand: brand,
        additional_properties: struct
      )
    end

    # Serialize an instance of UpdateCompanyResponse to a JSON object
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
      obj.success&.is_a?(Boolean) != false || raise("Passed value for field obj.success is not the expected type, validation failed.")
      obj.brand.nil? || Pinnacle::UpdateCompanyResponseBrand.validate_raw(obj: obj.brand)
    end
  end
end
