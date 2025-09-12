# frozen_string_literal: true

require_relative "enhanced_contact"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Enhanced contact information associated with the phone number.
    class AdvancedPhoneInformationContact
      # @return [String] Given name of the primary contact.
      attr_reader :first_name
      # @return [String] Family name of the primary contact.
      attr_reader :last_name
      # @return [String] Primary email associated with the number’s registration.
      attr_reader :email_address
      # @return [String] Street address including number and street name.
      attr_reader :street
      # @return [String] Secondary address info like suite or apartment number.
      attr_reader :unit
      # @return [String] Combined city, state, and postal info in a human-readable format.
      attr_reader :place
      # @return [String] Postal or ZIP code of the contact’s address.
      attr_reader :zip
      # @return [String] Full state or province name of the contact’s address.
      attr_reader :state
      # @return [String] Full country name of the contact’s registered address.
      attr_reader :country
      # @return [Pinnacle::Types::ENHANCED_CONTACT] Collection of online profiles and social media accounts associated with the
      #  contact. <br>
      #  These are potential candidates and may be inaccurate. Always double check.
      attr_reader :profiles
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param first_name [String] Given name of the primary contact.
      # @param last_name [String] Family name of the primary contact.
      # @param email_address [String] Primary email associated with the number’s registration.
      # @param street [String] Street address including number and street name.
      # @param unit [String] Secondary address info like suite or apartment number.
      # @param place [String] Combined city, state, and postal info in a human-readable format.
      # @param zip [String] Postal or ZIP code of the contact’s address.
      # @param state [String] Full state or province name of the contact’s address.
      # @param country [String] Full country name of the contact’s registered address.
      # @param profiles [Pinnacle::Types::ENHANCED_CONTACT] Collection of online profiles and social media accounts associated with the
      #  contact. <br>
      #  These are potential candidates and may be inaccurate. Always double check.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::AdvancedPhoneInformationContact]
      def initialize(first_name: OMIT, last_name: OMIT, email_address: OMIT, street: OMIT, unit: OMIT, place: OMIT,
                     zip: OMIT, state: OMIT, country: OMIT, profiles: OMIT, additional_properties: nil)
        @first_name = first_name if first_name != OMIT
        @last_name = last_name if last_name != OMIT
        @email_address = email_address if email_address != OMIT
        @street = street if street != OMIT
        @unit = unit if unit != OMIT
        @place = place if place != OMIT
        @zip = zip if zip != OMIT
        @state = state if state != OMIT
        @country = country if country != OMIT
        @profiles = profiles if profiles != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "firstName": first_name,
          "lastName": last_name,
          "emailAddress": email_address,
          "street": street,
          "unit": unit,
          "place": place,
          "zip": zip,
          "state": state,
          "country": country,
          "profiles": profiles
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AdvancedPhoneInformationContact
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::AdvancedPhoneInformationContact]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        first_name = parsed_json["firstName"]
        last_name = parsed_json["lastName"]
        email_address = parsed_json["emailAddress"]
        street = parsed_json["street"]
        unit = parsed_json["unit"]
        place = parsed_json["place"]
        zip = parsed_json["zip"]
        state = parsed_json["state"]
        country = parsed_json["country"]
        profiles = parsed_json["profiles"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::EnhancedContactItem.from_json(json_object: item)
        end
        new(
          first_name: first_name,
          last_name: last_name,
          email_address: email_address,
          street: street,
          unit: unit,
          place: place,
          zip: zip,
          state: state,
          country: country,
          profiles: profiles,
          additional_properties: struct
        )
      end

      # Serialize an instance of AdvancedPhoneInformationContact to a JSON object
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
        obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
        obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
        obj.email_address&.is_a?(String) != false || raise("Passed value for field obj.email_address is not the expected type, validation failed.")
        obj.street&.is_a?(String) != false || raise("Passed value for field obj.street is not the expected type, validation failed.")
        obj.unit&.is_a?(String) != false || raise("Passed value for field obj.unit is not the expected type, validation failed.")
        obj.place&.is_a?(String) != false || raise("Passed value for field obj.place is not the expected type, validation failed.")
        obj.zip&.is_a?(String) != false || raise("Passed value for field obj.zip is not the expected type, validation failed.")
        obj.state&.is_a?(String) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
        obj.country&.is_a?(String) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
        obj.profiles&.is_a?(Array) != false || raise("Passed value for field obj.profiles is not the expected type, validation failed.")
      end
    end
  end
end
