# frozen_string_literal: true

require_relative "campaign_validation_response_errors_item"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class CampaignValidationResult
      # @return [Array<Pinnacle::Types::CampaignValidationResponseErrorsItem>] List of validation errors.
      attr_reader :errors
      # @return [Boolean] Whether the campaign is valid or not.
      attr_reader :is_valid
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param errors [Array<Pinnacle::Types::CampaignValidationResponseErrorsItem>] List of validation errors.
      # @param is_valid [Boolean] Whether the campaign is valid or not.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::CampaignValidationResult]
      def initialize(errors:, is_valid:, additional_properties: nil)
        @errors = errors
        @is_valid = is_valid
        @additional_properties = additional_properties
        @_field_set = { "errors": errors, "is_valid": is_valid }
      end

      # Deserialize a JSON object to an instance of CampaignValidationResult
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::CampaignValidationResult]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        errors = parsed_json["errors"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::CampaignValidationResponseErrorsItem.from_json(json_object: item)
        end
        is_valid = parsed_json["is_valid"]
        new(
          errors: errors,
          is_valid: is_valid,
          additional_properties: struct
        )
      end

      # Serialize an instance of CampaignValidationResult to a JSON object
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
        obj.errors.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
        obj.is_valid.is_a?(Boolean) != false || raise("Passed value for field obj.is_valid is not the expected type, validation failed.")
      end
    end
  end
end
