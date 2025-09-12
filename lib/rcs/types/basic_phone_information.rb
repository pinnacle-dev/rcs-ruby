# frozen_string_literal: true

require_relative "phone_number_enum"
require_relative "number_format"
require_relative "basic_phone_information_location"
require_relative "basic_phone_information_contact"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Key details about a phone number, including its validity, type, location,
    #  carrier, and contact information.
    #  Provides the essential data required for verification, display, and basic
    #  analysis.
    class BasicPhoneInformation
      # @return [Boolean] Indicates whether the phone number is valid and capable of receiving
      #  communications.
      attr_reader :is_valid
      # @return [Pinnacle::Types::PhoneNumberEnum] Classification of the phone number.
      attr_reader :type
      # @return [Pinnacle::Types::NumberFormat] Different standardized ways the phone number can be formatted for display.
      attr_reader :formats
      # @return [Pinnacle::Types::BasicPhoneInformationLocation] Geographic and political details where the phone number is registered.
      attr_reader :location
      # @return [String] The telecommunications carrier or service provider for the number.
      attr_reader :carrier
      # @return [Pinnacle::Types::BasicPhoneInformationContact] Contact information linked to the phone number registration, if available.
      attr_reader :contact
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param is_valid [Boolean] Indicates whether the phone number is valid and capable of receiving
      #  communications.
      # @param type [Pinnacle::Types::PhoneNumberEnum] Classification of the phone number.
      # @param formats [Pinnacle::Types::NumberFormat] Different standardized ways the phone number can be formatted for display.
      # @param location [Pinnacle::Types::BasicPhoneInformationLocation] Geographic and political details where the phone number is registered.
      # @param carrier [String] The telecommunications carrier or service provider for the number.
      # @param contact [Pinnacle::Types::BasicPhoneInformationContact] Contact information linked to the phone number registration, if available.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::BasicPhoneInformation]
      def initialize(is_valid:, type:, formats:, location:, carrier:, contact:, additional_properties: nil)
        @is_valid = is_valid
        @type = type
        @formats = formats
        @location = location
        @carrier = carrier
        @contact = contact
        @additional_properties = additional_properties
        @_field_set = {
          "isValid": is_valid,
          "type": type,
          "formats": formats,
          "location": location,
          "carrier": carrier,
          "contact": contact
        }
      end

      # Deserialize a JSON object to an instance of BasicPhoneInformation
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::BasicPhoneInformation]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        is_valid = parsed_json["isValid"]
        type = parsed_json["type"]
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
          location = Pinnacle::Types::BasicPhoneInformationLocation.from_json(json_object: location)
        end
        carrier = parsed_json["carrier"]
        if parsed_json["contact"].nil?
          contact = nil
        else
          contact = parsed_json["contact"].to_json
          contact = Pinnacle::Types::BasicPhoneInformationContact.from_json(json_object: contact)
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

      # Serialize an instance of BasicPhoneInformation to a JSON object
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
        obj.type.is_a?(Pinnacle::Types::PhoneNumberEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        Pinnacle::Types::NumberFormat.validate_raw(obj: obj.formats)
        Pinnacle::Types::BasicPhoneInformationLocation.validate_raw(obj: obj.location)
        obj.carrier.is_a?(String) != false || raise("Passed value for field obj.carrier is not the expected type, validation failed.")
        Pinnacle::Types::BasicPhoneInformationContact.validate_raw(obj: obj.contact)
      end
    end
  end
end
