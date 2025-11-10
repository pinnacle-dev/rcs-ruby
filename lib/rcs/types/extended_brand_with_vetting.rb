# frozen_string_literal: true

require_relative "vetting_feedback"
require_relative "vetting_history"
require_relative "brand_status_enum"
require_relative "optional_contacts"
require_relative "company_sector_enum"
require_relative "company_type_enum"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class ExtendedBrandWithVetting
      # @return [String] ISO 8601 formatted timestamp of the last TCR vetting.
      attr_reader :last_tcr_vetting_date
      # @return [Array<Pinnacle::Types::VettingFeedback>] Feedback from The Campaign Registry if TCR vetting was performed.
      attr_reader :tcr_feedback
      # @return [Array<Pinnacle::Types::VettingHistory>] History of all external vetting attempts for this brand.
      attr_reader :vetting_history
      # @return [String] ISO 8601 formatted timestamp of when this brand was added to our system.
      attr_reader :created_at
      # @return [String] The brand's ID. This identifier is a string that always begins with the prefix
      #  `b_`, for example: `b_1234567890`.
      attr_reader :id
      # @return [Boolean] Indicates if this brand is archived.
      attr_reader :is_archived
      # @return [Pinnacle::Types::BrandStatusEnum] Current review status of the brand. <br>
      #  `INCOMPLETE`: Not submitted. <br>
      #  `IN REVIEW`: Being reviewed by carriers. <br>
      #  `VERIFIED`: Approved and ready to send messages. <br>
      #  `FAILED`: Issues and errors related to the campaign's details. <br>
      #  `VETTED`: Has undergone additional vetting by a third party service post the
      #  brand being verified. Your brand will be assigned a trust score, with higher
      #  trust scores having higher message volumes. <br>
      #  `UNVERIFIED`: Brand details have been updated, and the brand will need to
      #  undergo re-verification.
      attr_reader :status
      # @return [String] ISO 8601 formatted timestamp of when this brand was last updated.
      attr_reader :updated_at
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

      # @param last_tcr_vetting_date [String] ISO 8601 formatted timestamp of the last TCR vetting.
      # @param tcr_feedback [Array<Pinnacle::Types::VettingFeedback>] Feedback from The Campaign Registry if TCR vetting was performed.
      # @param vetting_history [Array<Pinnacle::Types::VettingHistory>] History of all external vetting attempts for this brand.
      # @param created_at [String] ISO 8601 formatted timestamp of when this brand was added to our system.
      # @param id [String] The brand's ID. This identifier is a string that always begins with the prefix
      #  `b_`, for example: `b_1234567890`.
      # @param is_archived [Boolean] Indicates if this brand is archived.
      # @param status [Pinnacle::Types::BrandStatusEnum] Current review status of the brand. <br>
      #  `INCOMPLETE`: Not submitted. <br>
      #  `IN REVIEW`: Being reviewed by carriers. <br>
      #  `VERIFIED`: Approved and ready to send messages. <br>
      #  `FAILED`: Issues and errors related to the campaign's details. <br>
      #  `VETTED`: Has undergone additional vetting by a third party service post the
      #  brand being verified. Your brand will be assigned a trust score, with higher
      #  trust scores having higher message volumes. <br>
      #  `UNVERIFIED`: Brand details have been updated, and the brand will need to
      #  undergo re-verification.
      # @param updated_at [String] ISO 8601 formatted timestamp of when this brand was last updated.
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
      # @return [Pinnacle::Types::ExtendedBrandWithVetting]
      def initialize(vetting_history:, created_at:, id:, is_archived:, status:, updated_at:,
                     last_tcr_vetting_date: OMIT, tcr_feedback: OMIT, address: OMIT, contact: OMIT, dba: OMIT, description: OMIT, ein: OMIT, email: OMIT, name: OMIT, sector: OMIT, type: OMIT, website: OMIT, additional_properties: nil)
        @last_tcr_vetting_date = last_tcr_vetting_date if last_tcr_vetting_date != OMIT
        @tcr_feedback = tcr_feedback if tcr_feedback != OMIT
        @vetting_history = vetting_history
        @created_at = created_at
        @id = id
        @is_archived = is_archived
        @status = status
        @updated_at = updated_at
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
          "lastTcrVettingDate": last_tcr_vetting_date,
          "tcrFeedback": tcr_feedback,
          "vettingHistory": vetting_history,
          "createdAt": created_at,
          "id": id,
          "isArchived": is_archived,
          "status": status,
          "updatedAt": updated_at,
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

      # Deserialize a JSON object to an instance of ExtendedBrandWithVetting
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::ExtendedBrandWithVetting]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        last_tcr_vetting_date = parsed_json["lastTcrVettingDate"]
        tcr_feedback = parsed_json["tcrFeedback"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::VettingFeedback.from_json(json_object: item)
        end
        vetting_history = parsed_json["vettingHistory"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::VettingHistory.from_json(json_object: item)
        end
        created_at = parsed_json["createdAt"]
        id = parsed_json["id"]
        is_archived = parsed_json["isArchived"]
        status = parsed_json["status"]
        updated_at = parsed_json["updatedAt"]
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
          last_tcr_vetting_date: last_tcr_vetting_date,
          tcr_feedback: tcr_feedback,
          vetting_history: vetting_history,
          created_at: created_at,
          id: id,
          is_archived: is_archived,
          status: status,
          updated_at: updated_at,
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

      # Serialize an instance of ExtendedBrandWithVetting to a JSON object
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
        obj.last_tcr_vetting_date&.is_a?(String) != false || raise("Passed value for field obj.last_tcr_vetting_date is not the expected type, validation failed.")
        obj.tcr_feedback&.is_a?(Array) != false || raise("Passed value for field obj.tcr_feedback is not the expected type, validation failed.")
        obj.vetting_history.is_a?(Array) != false || raise("Passed value for field obj.vetting_history is not the expected type, validation failed.")
        obj.created_at.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.is_archived.is_a?(Boolean) != false || raise("Passed value for field obj.is_archived is not the expected type, validation failed.")
        obj.status.is_a?(Pinnacle::Types::BrandStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.updated_at.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
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
