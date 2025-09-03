# frozen_string_literal: true

require "json"
require_relative "company_register_request_company_id"
require_relative "company_register_request_company"

module Pinnacle
  class Company
    class CompanyRegisterRequest
      # Deserialize a JSON object to an instance of CompanyRegisterRequest
      #
      # @param json_object [String]
      # @return [Pinnacle::Company::CompanyRegisterRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Pinnacle::Company::CompanyRegisterRequestCompanyId.validate_raw(obj: struct)
          return Pinnacle::Company::CompanyRegisterRequestCompanyId.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Pinnacle::Company::CompanyRegisterRequestCompany.validate_raw(obj: struct)
          return Pinnacle::Company::CompanyRegisterRequestCompany.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        struct
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        begin
          return Pinnacle::Company::CompanyRegisterRequestCompanyId.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Pinnacle::Company::CompanyRegisterRequestCompany.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
