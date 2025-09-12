# frozen_string_literal: true

require_relative "rcs_campaign_opt_in_method_enum"
require "ostruct"
require "json"

module Pinnacle
  # Opt-in configuration.
  class RcsCampaignSchemaExtraOptIn
    # @return [Pinnacle::RcsCampaignOptInMethodEnum]
    attr_reader :method
    # @return [String] Message shown to users explaining what they are agreeing to when opting in.
    attr_reader :terms_and_conditions
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param method [Pinnacle::RcsCampaignOptInMethodEnum]
    # @param terms_and_conditions [String] Message shown to users explaining what they are agreeing to when opting in.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::RcsCampaignSchemaExtraOptIn]
    def initialize(method: OMIT, terms_and_conditions: OMIT, additional_properties: nil)
      @method = method if method != OMIT
      @terms_and_conditions = terms_and_conditions if terms_and_conditions != OMIT
      @additional_properties = additional_properties
      @_field_set = { "method": method, "termsAndConditions": terms_and_conditions }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of RcsCampaignSchemaExtraOptIn
    #
    # @param json_object [String]
    # @return [Pinnacle::RcsCampaignSchemaExtraOptIn]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      method = parsed_json["method"]
      terms_and_conditions = parsed_json["termsAndConditions"]
      new(
        method: method,
        terms_and_conditions: terms_and_conditions,
        additional_properties: struct
      )
    end

    # Serialize an instance of RcsCampaignSchemaExtraOptIn to a JSON object
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
      obj.method&.is_a?(Pinnacle::RcsCampaignOptInMethodEnum) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
      obj.terms_and_conditions&.is_a?(String) != false || raise("Passed value for field obj.terms_and_conditions is not the expected type, validation failed.")
    end
  end
end
