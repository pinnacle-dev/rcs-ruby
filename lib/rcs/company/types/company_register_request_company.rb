# frozen_string_literal: true

require_relative "../../types/company_details"
require_relative "../../types/company_contact"
require_relative "../../types/messaging"
require_relative "../../types/point_of_contact"
require_relative "../../types/optionals"
require "ostruct"
require "json"

module Pinnacle
  class Company
    # Register a new company
    class CompanyRegisterRequestCompany
      # @return [Pinnacle::CompanyDetails]
      attr_reader :company
      # @return [Pinnacle::CompanyContact]
      attr_reader :company_contact
      # @return [Pinnacle::Messaging]
      attr_reader :messaging
      # @return [Pinnacle::PointOfContact]
      attr_reader :point_of_contact
      # @return [Pinnacle::Optionals]
      attr_reader :optionals
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param company [Pinnacle::CompanyDetails]
      # @param company_contact [Pinnacle::CompanyContact]
      # @param messaging [Pinnacle::Messaging]
      # @param point_of_contact [Pinnacle::PointOfContact]
      # @param optionals [Pinnacle::Optionals]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Company::CompanyRegisterRequestCompany]
      def initialize(company:, company_contact:, messaging:, point_of_contact:, optionals: OMIT,
                     additional_properties: nil)
        @company = company
        @company_contact = company_contact
        @messaging = messaging
        @point_of_contact = point_of_contact
        @optionals = optionals if optionals != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "company": company,
          "companyContact": company_contact,
          "messaging": messaging,
          "pointOfContact": point_of_contact,
          "optionals": optionals
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of CompanyRegisterRequestCompany
      #
      # @param json_object [String]
      # @return [Pinnacle::Company::CompanyRegisterRequestCompany]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Pinnacle::CompanyDetails.from_json(json_object: company)
        end
        if parsed_json["companyContact"].nil?
          company_contact = nil
        else
          company_contact = parsed_json["companyContact"].to_json
          company_contact = Pinnacle::CompanyContact.from_json(json_object: company_contact)
        end
        if parsed_json["messaging"].nil?
          messaging = nil
        else
          messaging = parsed_json["messaging"].to_json
          messaging = Pinnacle::Messaging.from_json(json_object: messaging)
        end
        if parsed_json["pointOfContact"].nil?
          point_of_contact = nil
        else
          point_of_contact = parsed_json["pointOfContact"].to_json
          point_of_contact = Pinnacle::PointOfContact.from_json(json_object: point_of_contact)
        end
        if parsed_json["optionals"].nil?
          optionals = nil
        else
          optionals = parsed_json["optionals"].to_json
          optionals = Pinnacle::Optionals.from_json(json_object: optionals)
        end
        new(
          company: company,
          company_contact: company_contact,
          messaging: messaging,
          point_of_contact: point_of_contact,
          optionals: optionals,
          additional_properties: struct
        )
      end

      # Serialize an instance of CompanyRegisterRequestCompany to a JSON object
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
        Pinnacle::CompanyDetails.validate_raw(obj: obj.company)
        Pinnacle::CompanyContact.validate_raw(obj: obj.company_contact)
        Pinnacle::Messaging.validate_raw(obj: obj.messaging)
        Pinnacle::PointOfContact.validate_raw(obj: obj.point_of_contact)
        obj.optionals.nil? || Pinnacle::Optionals.validate_raw(obj: obj.optionals)
      end
    end
  end
end
