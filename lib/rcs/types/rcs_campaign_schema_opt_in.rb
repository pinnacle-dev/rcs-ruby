# frozen_string_literal: true

require_relative "rcs_campaign_opt_in_method_enum"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Opt-in configuration.
    class RcsCampaignSchemaOptIn
      # @return [String] Message shown to users explaining what they are agreeing to when opting in.
      attr_reader :terms_and_conditions
      # @return [Pinnacle::Types::RcsCampaignOptInMethodEnum]
      attr_reader :method_
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param terms_and_conditions [String] Message shown to users explaining what they are agreeing to when opting in.
      # @param method_ [Pinnacle::Types::RcsCampaignOptInMethodEnum]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RcsCampaignSchemaOptIn]
      def initialize(terms_and_conditions: OMIT, method_: OMIT, additional_properties: nil)
        @terms_and_conditions = terms_and_conditions if terms_and_conditions != OMIT
        @method_ = method_ if method_ != OMIT
        @additional_properties = additional_properties
        @_field_set = { "termsAndConditions": terms_and_conditions, "method": method_ }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RcsCampaignSchemaOptIn
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RcsCampaignSchemaOptIn]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        terms_and_conditions = parsed_json["termsAndConditions"]
        method_ = parsed_json["method"]
        new(
          terms_and_conditions: terms_and_conditions,
          method_: method_,
          additional_properties: struct
        )
      end

      # Serialize an instance of RcsCampaignSchemaOptIn to a JSON object
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
        obj.terms_and_conditions&.is_a?(String) != false || raise("Passed value for field obj.terms_and_conditions is not the expected type, validation failed.")
        obj.method_&.is_a?(Pinnacle::Types::RcsCampaignOptInMethodEnum) != false || raise("Passed value for field obj.method_ is not the expected type, validation failed.")
      end
    end
  end
end
