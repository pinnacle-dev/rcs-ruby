# frozen_string_literal: true

require_relative "advanced_phone_information_type"
require_relative "number_format"
require_relative "advanced_phone_information_location"
require_relative "advanced_phone_information_carrier"
require_relative "advanced_phone_information_contact"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Detailed phone number analysis including validation status, classification with
    #  fraud risk,
    #  precise geographic data, carrier intelligence, and enhanced contact information.
    #  Provides comprehensive insights for risk assessment, compliance, and advanced
    #  usage scenarios.
    class AdvancedPhoneInformation
      # @return [Boolean] Indicates whether the phone number is valid and capable of receiving
      #  communications.
      attr_reader :is_valid
      # @return [Pinnacle::Types::AdvancedPhoneInformationType] Detailed classification including fraud risk and security recommendations.
      attr_reader :type
      # @return [Pinnacle::Types::NumberFormat] Different standardized ways the phone number can be formatted for display or
      #  dialing.
      attr_reader :formats
      # @return [Pinnacle::Types::AdvancedPhoneInformationLocation] Comprehensive geographic and administrative location data with precise
      #  coordinates
      #  and timezone information for accurate localization.
      attr_reader :location
      # @return [Pinnacle::Types::AdvancedPhoneInformationCarrier] Detailed carrier information.
      attr_reader :carrier
      # @return [Pinnacle::Types::AdvancedPhoneInformationContact] Enhanced contact information associated with the phone number.
      attr_reader :contact
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param is_valid [Boolean] Indicates whether the phone number is valid and capable of receiving
      #  communications.
      # @param type [Pinnacle::Types::AdvancedPhoneInformationType] Detailed classification including fraud risk and security recommendations.
      # @param formats [Pinnacle::Types::NumberFormat] Different standardized ways the phone number can be formatted for display or
      #  dialing.
      # @param location [Pinnacle::Types::AdvancedPhoneInformationLocation] Comprehensive geographic and administrative location data with precise
      #  coordinates
      #  and timezone information for accurate localization.
      # @param carrier [Pinnacle::Types::AdvancedPhoneInformationCarrier] Detailed carrier information.
      # @param contact [Pinnacle::Types::AdvancedPhoneInformationContact] Enhanced contact information associated with the phone number.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::AdvancedPhoneInformation]
      def initialize(is_valid:, type:, formats:, location:, carrier:, contact: OMIT, additional_properties: nil)
        @is_valid = is_valid
        @type = type
        @formats = formats
        @location = location
        @carrier = carrier
        @contact = contact if contact != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "isValid": is_valid,
          "type": type,
          "formats": formats,
          "location": location,
          "carrier": carrier,
          "contact": contact
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AdvancedPhoneInformation
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::AdvancedPhoneInformation]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        is_valid = parsed_json["isValid"]
        if parsed_json["type"].nil?
          type = nil
        else
          type = parsed_json["type"].to_json
          type = Pinnacle::Types::AdvancedPhoneInformationType.from_json(json_object: type)
        end
        if parsed_json["formats"].nil?
          formats = nil
        else
          formats = parsed_json["formats"].to_json
          formats = Pinnacle::Types::NumberFormat.from_json(json_object: formats)
        end
        if parsed_json["location"].nil?
          location = nil
        else
          location = parsed_json["location"].to_json
          location = Pinnacle::Types::AdvancedPhoneInformationLocation.from_json(json_object: location)
        end
        if parsed_json["carrier"].nil?
          carrier = nil
        else
          carrier = parsed_json["carrier"].to_json
          carrier = Pinnacle::Types::AdvancedPhoneInformationCarrier.from_json(json_object: carrier)
        end
        if parsed_json["contact"].nil?
          contact = nil
        else
          contact = parsed_json["contact"].to_json
          contact = Pinnacle::Types::AdvancedPhoneInformationContact.from_json(json_object: contact)
        end
        new(
          is_valid: is_valid,
          type: type,
          formats: formats,
          location: location,
          carrier: carrier,
          contact: contact,
          additional_properties: struct
        )
      end

      # Serialize an instance of AdvancedPhoneInformation to a JSON object
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
        obj.is_valid.is_a?(Boolean) != false || raise("Passed value for field obj.is_valid is not the expected type, validation failed.")
        Pinnacle::Types::AdvancedPhoneInformationType.validate_raw(obj: obj.type)
        Pinnacle::Types::NumberFormat.validate_raw(obj: obj.formats)
        Pinnacle::Types::AdvancedPhoneInformationLocation.validate_raw(obj: obj.location)
        Pinnacle::Types::AdvancedPhoneInformationCarrier.validate_raw(obj: obj.carrier)
        obj.contact.nil? || Pinnacle::Types::AdvancedPhoneInformationContact.validate_raw(obj: obj.contact)
      end
    end
  end
end
