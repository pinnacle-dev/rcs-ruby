# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Types
    # Legal documentation links.
    class TollFreeCampaignSchemaLinks
      # @return [String] Privacy policy URL.
      attr_reader :privacy_policy
      # @return [String] Terms of service URL.
      attr_reader :terms_of_service
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param privacy_policy [String] Privacy policy URL.
      # @param terms_of_service [String] Terms of service URL.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::TollFreeCampaignSchemaLinks]
      def initialize(privacy_policy: OMIT, terms_of_service: OMIT, additional_properties: nil)
        @privacy_policy = privacy_policy if privacy_policy != OMIT
        @terms_of_service = terms_of_service if terms_of_service != OMIT
        @additional_properties = additional_properties
        @_field_set = { "privacyPolicy": privacy_policy, "termsOfService": terms_of_service }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of TollFreeCampaignSchemaLinks
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::TollFreeCampaignSchemaLinks]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        privacy_policy = parsed_json["privacyPolicy"]
        terms_of_service = parsed_json["termsOfService"]
        new(
          privacy_policy: privacy_policy,
          terms_of_service: terms_of_service,
          additional_properties: struct
        )
      end

      # Serialize an instance of TollFreeCampaignSchemaLinks to a JSON object
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
        obj.privacy_policy&.is_a?(String) != false || raise("Passed value for field obj.privacy_policy is not the expected type, validation failed.")
        obj.terms_of_service&.is_a?(String) != false || raise("Passed value for field obj.terms_of_service is not the expected type, validation failed.")
      end
    end
  end
end
