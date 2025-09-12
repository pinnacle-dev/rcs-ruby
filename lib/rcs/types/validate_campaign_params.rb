# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  class ValidateCampaignParams
    # @return [String] Any additional information you want to provide.
    attr_reader :additional_info
    # @return [Integer] Campaign ID.
    attr_reader :campaign_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param additional_info [String] Any additional information you want to provide.
    # @param campaign_id [Integer] Campaign ID.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::ValidateCampaignParams]
    def initialize(campaign_id:, additional_info: OMIT, additional_properties: nil)
      @additional_info = additional_info if additional_info != OMIT
      @campaign_id = campaign_id
      @additional_properties = additional_properties
      @_field_set = { "additionalInfo": additional_info, "campaignId": campaign_id }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ValidateCampaignParams
    #
    # @param json_object [String]
    # @return [Pinnacle::ValidateCampaignParams]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      additional_info = parsed_json["additionalInfo"]
      campaign_id = parsed_json["campaignId"]
      new(
        additional_info: additional_info,
        campaign_id: campaign_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of ValidateCampaignParams to a JSON object
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
      obj.additional_info&.is_a?(String) != false || raise("Passed value for field obj.additional_info is not the expected type, validation failed.")
      obj.campaign_id.is_a?(Integer) != false || raise("Passed value for field obj.campaign_id is not the expected type, validation failed.")
    end
  end
end
