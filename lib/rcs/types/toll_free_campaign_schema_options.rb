# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Campaign configuration options.
    class TollFreeCampaignSchemaOptions
      # @return [Boolean] Whether the campaign is age-gated.
      attr_reader :age_gated
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param age_gated [Boolean] Whether the campaign is age-gated.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::TollFreeCampaignSchemaOptions]
      def initialize(age_gated: OMIT, additional_properties: nil)
        @age_gated = age_gated if age_gated != OMIT
        @additional_properties = additional_properties
        @_field_set = { "ageGated": age_gated }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of TollFreeCampaignSchemaOptions
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::TollFreeCampaignSchemaOptions]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        age_gated = parsed_json["ageGated"]
        new(age_gated: age_gated, additional_properties: struct)
      end

      # Serialize an instance of TollFreeCampaignSchemaOptions to a JSON object
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
        obj.age_gated&.is_a?(Boolean) != false || raise("Passed value for field obj.age_gated is not the expected type, validation failed.")
      end
    end
  end
end
