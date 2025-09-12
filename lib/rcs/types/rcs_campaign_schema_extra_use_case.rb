# frozen_string_literal: true

require_relative "rcs_campaign_use_case_enum"
require "ostruct"
require "json"

module Pinnacle
  # Use case classification for the campaign.
  class RcsCampaignSchemaExtraUseCase
    # @return [String] Summary of the use case.
    attr_reader :behavior
    # @return [Pinnacle::RcsCampaignUseCaseEnum]
    attr_reader :value
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param behavior [String] Summary of the use case.
    # @param value [Pinnacle::RcsCampaignUseCaseEnum]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::RcsCampaignSchemaExtraUseCase]
    def initialize(behavior: OMIT, value: OMIT, additional_properties: nil)
      @behavior = behavior if behavior != OMIT
      @value = value if value != OMIT
      @additional_properties = additional_properties
      @_field_set = { "behavior": behavior, "value": value }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of RcsCampaignSchemaExtraUseCase
    #
    # @param json_object [String]
    # @return [Pinnacle::RcsCampaignSchemaExtraUseCase]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      behavior = parsed_json["behavior"]
      value = parsed_json["value"]
      new(
        behavior: behavior,
        value: value,
        additional_properties: struct
      )
    end

    # Serialize an instance of RcsCampaignSchemaExtraUseCase to a JSON object
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
      obj.behavior&.is_a?(String) != false || raise("Passed value for field obj.behavior is not the expected type, validation failed.")
      obj.value&.is_a?(Pinnacle::RcsCampaignUseCaseEnum) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
