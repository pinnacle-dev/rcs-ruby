# frozen_string_literal: true

require_relative "vetting_history_vetting_status"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class VettingHistory
      # @return [String] The vetting provider used.
      attr_reader :provider
      # @return [String] The vetting class level.
      attr_reader :vetting_class
      # @return [String] ISO 8601 formatted timestamp of when the vetting was initiated.
      attr_reader :vetting_date
      # @return [Float] Vetting score if available.
      attr_reader :vetting_score
      # @return [Pinnacle::Types::VettingHistoryVettingStatus] Current status of the vetting process.
      attr_reader :vetting_status
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param provider [String] The vetting provider used.
      # @param vetting_class [String] The vetting class level.
      # @param vetting_date [String] ISO 8601 formatted timestamp of when the vetting was initiated.
      # @param vetting_score [Float] Vetting score if available.
      # @param vetting_status [Pinnacle::Types::VettingHistoryVettingStatus] Current status of the vetting process.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::VettingHistory]
      def initialize(provider:, vetting_class:, vetting_date:, vetting_status:, vetting_score: OMIT,
                     additional_properties: nil)
        @provider = provider
        @vetting_class = vetting_class
        @vetting_date = vetting_date
        @vetting_score = vetting_score if vetting_score != OMIT
        @vetting_status = vetting_status
        @additional_properties = additional_properties
        @_field_set = {
          "provider": provider,
          "vettingClass": vetting_class,
          "vettingDate": vetting_date,
          "vettingScore": vetting_score,
          "vettingStatus": vetting_status
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of VettingHistory
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::VettingHistory]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        provider = parsed_json["provider"]
        vetting_class = parsed_json["vettingClass"]
        vetting_date = parsed_json["vettingDate"]
        vetting_score = parsed_json["vettingScore"]
        vetting_status = parsed_json["vettingStatus"]
        new(
          provider: provider,
          vetting_class: vetting_class,
          vetting_date: vetting_date,
          vetting_score: vetting_score,
          vetting_status: vetting_status,
          additional_properties: struct
        )
      end

      # Serialize an instance of VettingHistory to a JSON object
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
        obj.provider.is_a?(String) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
        obj.vetting_class.is_a?(String) != false || raise("Passed value for field obj.vetting_class is not the expected type, validation failed.")
        obj.vetting_date.is_a?(String) != false || raise("Passed value for field obj.vetting_date is not the expected type, validation failed.")
        obj.vetting_score&.is_a?(Float) != false || raise("Passed value for field obj.vetting_score is not the expected type, validation failed.")
        obj.vetting_status.is_a?(Pinnacle::Types::VettingHistoryVettingStatus) != false || raise("Passed value for field obj.vetting_status is not the expected type, validation failed.")
      end
    end
  end
end
