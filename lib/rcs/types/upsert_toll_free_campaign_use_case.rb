# frozen_string_literal: true

require_relative "toll_free_campaign_use_case_enum"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Use case classification for the campaign.
    class UpsertTollFreeCampaignUseCase
      # @return [String] Summary of the use case.
      attr_reader :summary
      # @return [Pinnacle::Types::TollFreeCampaignUseCaseEnum]
      attr_reader :value
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param summary [String] Summary of the use case.
      # @param value [Pinnacle::Types::TollFreeCampaignUseCaseEnum]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::UpsertTollFreeCampaignUseCase]
      def initialize(summary: OMIT, value: OMIT, additional_properties: nil)
        @summary = summary if summary != OMIT
        @value = value if value != OMIT
        @additional_properties = additional_properties
        @_field_set = { "summary": summary, "value": value }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of UpsertTollFreeCampaignUseCase
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::UpsertTollFreeCampaignUseCase]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        summary = parsed_json["summary"]
        value = parsed_json["value"]
        new(
          summary: summary,
          value: value,
          additional_properties: struct
        )
      end

      # Serialize an instance of UpsertTollFreeCampaignUseCase to a JSON object
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
        obj.summary&.is_a?(String) != false || raise("Passed value for field obj.summary is not the expected type, validation failed.")
        obj.value&.is_a?(Pinnacle::Types::TollFreeCampaignUseCaseEnum) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      end
    end
  end
end
