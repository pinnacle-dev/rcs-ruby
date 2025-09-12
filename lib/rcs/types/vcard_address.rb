# frozen_string_literal: true

require_relative "v_card_address_schema_type_item"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class VcardAddress
      # @return [String] Country name.
      attr_reader :country_name
      # @return [String] Extended address information (apartment, suite, etc.).
      attr_reader :extended_address
      # @return [String] Complete formatted address as a single string.
      attr_reader :fulladdress
      # @return [String] City or locality.
      attr_reader :locality
      # @return [String] ZIP code or postal code.
      attr_reader :postal_code
      # @return [String] P.O. Box number.
      attr_reader :post_office_box
      # @return [String] State, province, or region.
      attr_reader :region
      # @return [String] Street address or street name and number.
      attr_reader :street_address
      # @return [Array<Pinnacle::Types::VCardAddressSchemaTypeItem>] Address type classifications.
      attr_reader :type
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param country_name [String] Country name.
      # @param extended_address [String] Extended address information (apartment, suite, etc.).
      # @param fulladdress [String] Complete formatted address as a single string.
      # @param locality [String] City or locality.
      # @param postal_code [String] ZIP code or postal code.
      # @param post_office_box [String] P.O. Box number.
      # @param region [String] State, province, or region.
      # @param street_address [String] Street address or street name and number.
      # @param type [Array<Pinnacle::Types::VCardAddressSchemaTypeItem>] Address type classifications.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::VcardAddress]
      def initialize(country_name: OMIT, extended_address: OMIT, fulladdress: OMIT, locality: OMIT, postal_code: OMIT,
                     post_office_box: OMIT, region: OMIT, street_address: OMIT, type: OMIT, additional_properties: nil)
        @country_name = country_name if country_name != OMIT
        @extended_address = extended_address if extended_address != OMIT
        @fulladdress = fulladdress if fulladdress != OMIT
        @locality = locality if locality != OMIT
        @postal_code = postal_code if postal_code != OMIT
        @post_office_box = post_office_box if post_office_box != OMIT
        @region = region if region != OMIT
        @street_address = street_address if street_address != OMIT
        @type = type if type != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "countryName": country_name,
          "extendedAddress": extended_address,
          "fulladdress": fulladdress,
          "locality": locality,
          "postalCode": postal_code,
          "postOfficeBox": post_office_box,
          "region": region,
          "streetAddress": street_address,
          "type": type
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of VcardAddress
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::VcardAddress]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        country_name = parsed_json["countryName"]
        extended_address = parsed_json["extendedAddress"]
        fulladdress = parsed_json["fulladdress"]
        locality = parsed_json["locality"]
        postal_code = parsed_json["postalCode"]
        post_office_box = parsed_json["postOfficeBox"]
        region = parsed_json["region"]
        street_address = parsed_json["streetAddress"]
        type = parsed_json["type"]
        new(
          country_name: country_name,
          extended_address: extended_address,
          fulladdress: fulladdress,
          locality: locality,
          postal_code: postal_code,
          post_office_box: post_office_box,
          region: region,
          street_address: street_address,
          type: type,
          additional_properties: struct
        )
      end

      # Serialize an instance of VcardAddress to a JSON object
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
        obj.country_name&.is_a?(String) != false || raise("Passed value for field obj.country_name is not the expected type, validation failed.")
        obj.extended_address&.is_a?(String) != false || raise("Passed value for field obj.extended_address is not the expected type, validation failed.")
        obj.fulladdress&.is_a?(String) != false || raise("Passed value for field obj.fulladdress is not the expected type, validation failed.")
        obj.locality&.is_a?(String) != false || raise("Passed value for field obj.locality is not the expected type, validation failed.")
        obj.postal_code&.is_a?(String) != false || raise("Passed value for field obj.postal_code is not the expected type, validation failed.")
        obj.post_office_box&.is_a?(String) != false || raise("Passed value for field obj.post_office_box is not the expected type, validation failed.")
        obj.region&.is_a?(String) != false || raise("Passed value for field obj.region is not the expected type, validation failed.")
        obj.street_address&.is_a?(String) != false || raise("Passed value for field obj.street_address is not the expected type, validation failed.")
        obj.type&.is_a?(Array) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      end
    end
  end
end
