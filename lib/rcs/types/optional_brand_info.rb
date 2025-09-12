# frozen_string_literal: true

require_relative "optional_contacts"
require_relative "company_sector_enum"
require_relative "company_type_enum"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class OptionalBrandInfo
      # @return [String] Primary brand address where this brand is located.
      attr_reader :address
      # @return [Pinnacle::Types::OptionalContacts]
      attr_reader :contact
      # @return [String] "Doing Business As" name - the public name this brand operates under.
      attr_reader :dba
      # @return [String] Brief description of what this brand does.
      attr_reader :description
      # @return [String] Employer Identification Number (EIN) assigned by the IRS.
      attr_reader :ein
      # @return [String] Main contact email address for this brand.
      attr_reader :email
      # @return [String] Legal name of the brand as registered.
      attr_reader :name
      # @return [Pinnacle::Types::CompanySectorEnum]
      attr_reader :sector
      # @return [Pinnacle::Types::CompanyTypeEnum]
      attr_reader :type
      # @return [String] Brand website URL.
      attr_reader :website
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param address [String] Primary brand address where this brand is located.
      # @param contact [Pinnacle::Types::OptionalContacts]
      # @param dba [String] "Doing Business As" name - the public name this brand operates under.
      # @param description [String] Brief description of what this brand does.
      # @param ein [String] Employer Identification Number (EIN) assigned by the IRS.
      # @param email [String] Main contact email address for this brand.
      # @param name [String] Legal name of the brand as registered.
      # @param sector [Pinnacle::Types::CompanySectorEnum]
      # @param type [Pinnacle::Types::CompanyTypeEnum]
      # @param website [String] Brand website URL.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::OptionalBrandInfo]
      def initialize(address: OMIT, contact: OMIT, dba: OMIT, description: OMIT, ein: OMIT, email: OMIT, name: OMIT,
                     sector: OMIT, type: OMIT, website: OMIT, additional_properties: nil)
        @address = address if address != OMIT
        @contact = contact if contact != OMIT
        @dba = dba if dba != OMIT
        @description = description if description != OMIT
        @ein = ein if ein != OMIT
        @email = email if email != OMIT
        @name = name if name != OMIT
        @sector = sector if sector != OMIT
        @type = type if type != OMIT
        @website = website if website != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "address": address,
          "contact": contact,
          "dba": dba,
          "description": description,
          "ein": ein,
          "email": email,
          "name": name,
          "sector": sector,
          "type": type,
          "website": website
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of OptionalBrandInfo
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::OptionalBrandInfo]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        address = parsed_json["address"]
        if parsed_json["contact"].nil?
          contact = nil
        else
          contact = parsed_json["contact"].to_json
          contact = Pinnacle::Types::OptionalContacts.from_json(json_object: contact)
        end
        dba = parsed_json["dba"]
        description = parsed_json["description"]
        ein = parsed_json["ein"]
        email = parsed_json["email"]
        name = parsed_json["name"]
        sector = parsed_json["sector"]
        type = parsed_json["type"]
        website = parsed_json["website"]
        new(
          address: address,
          contact: contact,
          dba: dba,
          description: description,
          ein: ein,
          email: email,
          name: name,
          sector: sector,
          type: type,
          website: website,
          additional_properties: struct
        )
      end

      # Serialize an instance of OptionalBrandInfo to a JSON object
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
        obj.address&.is_a?(String) != false || raise("Passed value for field obj.address is not the expected type, validation failed.")
        obj.contact.nil? || Pinnacle::Types::OptionalContacts.validate_raw(obj: obj.contact)
        obj.dba&.is_a?(String) != false || raise("Passed value for field obj.dba is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.ein&.is_a?(String) != false || raise("Passed value for field obj.ein is not the expected type, validation failed.")
        obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.sector&.is_a?(Pinnacle::Types::CompanySectorEnum) != false || raise("Passed value for field obj.sector is not the expected type, validation failed.")
        obj.type&.is_a?(Pinnacle::Types::CompanyTypeEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.website&.is_a?(String) != false || raise("Passed value for field obj.website is not the expected type, validation failed.")
      end
    end
  end
end
