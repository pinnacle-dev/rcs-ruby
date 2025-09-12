# frozen_string_literal: true

require_relative "detailed_phone_number_enum"
require_relative "advanced_phone_information_type_recommendation"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Detailed classification including fraud risk and security recommendations.
    class AdvancedPhoneInformationType
      # @return [Pinnacle::Types::DetailedPhoneNumberEnum] Technical classification derived from carrier intelligence systems.
      attr_reader :value
      # @return [String] Explanation of the phone number type and service
      attr_reader :description
      # @return [String] Additional technical details about the service type, billing model,
      #  and typical usage patterns for this number classification.
      attr_reader :details
      # @return [Pinnacle::Types::AdvancedPhoneInformationTypeRecommendation] Security recommendation based on fraud risk analysis:
      #  - `ALLOW`: Low risk, safe for normal use.
      #  - `BLOCK`: High risk, block or require additional verification.
      #  - `FLAG`: Medium risk, recommend further scrutiny or monitoring.
      attr_reader :recommendation
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param value [Pinnacle::Types::DetailedPhoneNumberEnum] Technical classification derived from carrier intelligence systems.
      # @param description [String] Explanation of the phone number type and service
      # @param details [String] Additional technical details about the service type, billing model,
      #  and typical usage patterns for this number classification.
      # @param recommendation [Pinnacle::Types::AdvancedPhoneInformationTypeRecommendation] Security recommendation based on fraud risk analysis:
      #  - `ALLOW`: Low risk, safe for normal use.
      #  - `BLOCK`: High risk, block or require additional verification.
      #  - `FLAG`: Medium risk, recommend further scrutiny or monitoring.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::AdvancedPhoneInformationType]
      def initialize(value:, description:, details:, recommendation:, additional_properties: nil)
        @value = value
        @description = description
        @details = details
        @recommendation = recommendation
        @additional_properties = additional_properties
        @_field_set = {
          "value": value,
          "description": description,
          "details": details,
          "recommendation": recommendation
        }
      end

      # Deserialize a JSON object to an instance of AdvancedPhoneInformationType
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::AdvancedPhoneInformationType]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        value = parsed_json["value"]
        description = parsed_json["description"]
        details = parsed_json["details"]
        recommendation = parsed_json["recommendation"]
        new(
          value: value,
          description: description,
          details: details,
          recommendation: recommendation,
          additional_properties: struct
        )
      end

      # Serialize an instance of AdvancedPhoneInformationType to a JSON object
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
        obj.value.is_a?(Pinnacle::Types::DetailedPhoneNumberEnum) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
        obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.details.is_a?(String) != false || raise("Passed value for field obj.details is not the expected type, validation failed.")
        obj.recommendation.is_a?(Pinnacle::Types::AdvancedPhoneInformationTypeRecommendation) != false || raise("Passed value for field obj.recommendation is not the expected type, validation failed.")
      end
    end
  end
end
