# frozen_string_literal: true

require_relative "company_update_response_brand"
require "ostruct"
require "json"

module Pinnacle
  class Company
    class CompanyUpdateResponse
      # @return [Pinnacle::Company::CompanyUpdateResponseBrand]
      attr_reader :brand
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param brand [Pinnacle::Company::CompanyUpdateResponseBrand]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Company::CompanyUpdateResponse]
      def initialize(brand:, additional_properties: nil)
        @brand = brand
        @additional_properties = additional_properties
        @_field_set = { "brand": brand }
      end

      # Deserialize a JSON object to an instance of CompanyUpdateResponse
      #
      # @param json_object [String]
      # @return [Pinnacle::Company::CompanyUpdateResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["brand"].nil?
          brand = nil
        else
          brand = parsed_json["brand"].to_json
          brand = Pinnacle::Company::CompanyUpdateResponseBrand.from_json(json_object: brand)
        end
        new(brand: brand, additional_properties: struct)
      end

      # Serialize an instance of CompanyUpdateResponse to a JSON object
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
        Pinnacle::Company::CompanyUpdateResponseBrand.validate_raw(obj: obj.brand)
      end
    end
  end
end
