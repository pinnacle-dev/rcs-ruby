# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class Company
    # Register an existing company
    class CompanyRegisterRequestCompanyId
      # @return [String] ID of an existing company to register
      attr_reader :company_id
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param company_id [String] ID of an existing company to register
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Company::CompanyRegisterRequestCompanyId]
      def initialize(company_id:, additional_properties: nil)
        @company_id = company_id
        @additional_properties = additional_properties
        @_field_set = { "companyId": company_id }
      end

      # Deserialize a JSON object to an instance of CompanyRegisterRequestCompanyId
      #
      # @param json_object [String]
      # @return [Pinnacle::Company::CompanyRegisterRequestCompanyId]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        company_id = parsed_json["companyId"]
        new(company_id: company_id, additional_properties: struct)
      end

      # Serialize an instance of CompanyRegisterRequestCompanyId to a JSON object
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
        obj.company_id.is_a?(String) != false || raise("Passed value for field obj.company_id is not the expected type, validation failed.")
      end
    end
  end
end
