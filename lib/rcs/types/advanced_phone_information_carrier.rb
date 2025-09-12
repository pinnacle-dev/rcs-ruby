# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Detailed carrier information.
    class AdvancedPhoneInformationCarrier
      # @return [String] Carrier or service provider name as registered with telecom authorities.
      attr_reader :name
      # @return [String] Standardized carrier name used across data sources.
      attr_reader :normalized_carrier
      # @return [String] Mobile Country Code - 3-digit identifier assigned by ITU-T for the country.
      #  Used in GSM, UMTS, and LTE networks for international roaming and
      #  identification.
      attr_reader :mcc
      # @return [String] Mobile Network Code - 2 or 3-digit identifier for the specific carrier within
      #  the country.
      #  Combined with MCC provides unique global identification of the mobile network.
      attr_reader :mnc
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param name [String] Carrier or service provider name as registered with telecom authorities.
      # @param normalized_carrier [String] Standardized carrier name used across data sources.
      # @param mcc [String] Mobile Country Code - 3-digit identifier assigned by ITU-T for the country.
      #  Used in GSM, UMTS, and LTE networks for international roaming and
      #  identification.
      # @param mnc [String] Mobile Network Code - 2 or 3-digit identifier for the specific carrier within
      #  the country.
      #  Combined with MCC provides unique global identification of the mobile network.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::AdvancedPhoneInformationCarrier]
      def initialize(name:, normalized_carrier:, mcc:, mnc:, additional_properties: nil)
        @name = name
        @normalized_carrier = normalized_carrier
        @mcc = mcc
        @mnc = mnc
        @additional_properties = additional_properties
        @_field_set = { "name": name, "normalizedCarrier": normalized_carrier, "mcc": mcc, "mnc": mnc }
      end

      # Deserialize a JSON object to an instance of AdvancedPhoneInformationCarrier
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::AdvancedPhoneInformationCarrier]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = parsed_json["name"]
        normalized_carrier = parsed_json["normalizedCarrier"]
        mcc = parsed_json["mcc"]
        mnc = parsed_json["mnc"]
        new(
          name: name,
          normalized_carrier: normalized_carrier,
          mcc: mcc,
          mnc: mnc,
          additional_properties: struct
        )
      end

      # Serialize an instance of AdvancedPhoneInformationCarrier to a JSON object
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
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.normalized_carrier.is_a?(String) != false || raise("Passed value for field obj.normalized_carrier is not the expected type, validation failed.")
        obj.mcc.is_a?(String) != false || raise("Passed value for field obj.mcc is not the expected type, validation failed.")
        obj.mnc.is_a?(String) != false || raise("Passed value for field obj.mnc is not the expected type, validation failed.")
      end
    end
  end
end
