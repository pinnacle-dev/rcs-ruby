# frozen_string_literal: true

require_relative "extended_brand"
require_relative "profile_status_enum"
require_relative "message_volume_enum"
require_relative "toll_free_campaign_schema_opt_in"
require_relative "toll_free_campaign_schema_use_case"
require "ostruct"
require "json"

module Pinnacle
  class TollFreeCampaignWithExtendedBrandAndStatus
    # @return [Pinnacle::ExtendedBrand] Brand associated with this campaign.
    attr_reader :brand
    # @return [Pinnacle::ProfileStatusEnum] Current review status of the brand.<br>
    #  `INCOMPLETE`: Has not been submitted.<br>
    #  `PENDING`: Currently being reviewed.<br>
    #  `VERIFIED`: Verified and good to go.<br>
    #  `UNVERIFIED`: No longer verified due to an update in the brand details.<br>
    #  `VETTED`: Brand has been vetted by an external provider and has received vetting
    #  scores.
    attr_reader :status
    # @return [Integer] Unique identifier for the campaign.
    attr_reader :campaign_id
    # @return [Pinnacle::MessageVolumeEnum]
    attr_reader :monthly_volume
    # @return [String] Display name of the campaign.
    attr_reader :name
    # @return [Pinnacle::TollFreeCampaignSchemaOptIn] Opt-in keyword settings.
    attr_reader :opt_in
    # @return [String] Explain message that would be sent.
    attr_reader :production_message_content
    # @return [Pinnacle::TollFreeCampaignSchemaUseCase] Use case classification for the campaign.
    attr_reader :use_case
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param brand [Pinnacle::ExtendedBrand] Brand associated with this campaign.
    # @param status [Pinnacle::ProfileStatusEnum] Current review status of the brand.<br>
    #  `INCOMPLETE`: Has not been submitted.<br>
    #  `PENDING`: Currently being reviewed.<br>
    #  `VERIFIED`: Verified and good to go.<br>
    #  `UNVERIFIED`: No longer verified due to an update in the brand details.<br>
    #  `VETTED`: Brand has been vetted by an external provider and has received vetting
    #  scores.
    # @param campaign_id [Integer] Unique identifier for the campaign.
    # @param monthly_volume [Pinnacle::MessageVolumeEnum]
    # @param name [String] Display name of the campaign.
    # @param opt_in [Pinnacle::TollFreeCampaignSchemaOptIn] Opt-in keyword settings.
    # @param production_message_content [String] Explain message that would be sent.
    # @param use_case [Pinnacle::TollFreeCampaignSchemaUseCase] Use case classification for the campaign.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Pinnacle::TollFreeCampaignWithExtendedBrandAndStatus]
    def initialize(brand:, status:, campaign_id: OMIT, monthly_volume: OMIT, name: OMIT, opt_in: OMIT,
                   production_message_content: OMIT, use_case: OMIT, additional_properties: nil)
      @brand = brand
      @status = status
      @campaign_id = campaign_id if campaign_id != OMIT
      @monthly_volume = monthly_volume if monthly_volume != OMIT
      @name = name if name != OMIT
      @opt_in = opt_in if opt_in != OMIT
      @production_message_content = production_message_content if production_message_content != OMIT
      @use_case = use_case if use_case != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "brand": brand,
        "status": status,
        "campaignId": campaign_id,
        "monthlyVolume": monthly_volume,
        "name": name,
        "optIn": opt_in,
        "productionMessageContent": production_message_content,
        "useCase": use_case
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of
    #  TollFreeCampaignWithExtendedBrandAndStatus
    #
    # @param json_object [String]
    # @return [Pinnacle::TollFreeCampaignWithExtendedBrandAndStatus]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["brand"].nil?
        brand = nil
      else
        brand = parsed_json["brand"].to_json
        brand = Pinnacle::ExtendedBrand.from_json(json_object: brand)
      end
      status = parsed_json["status"]
      campaign_id = parsed_json["campaignId"]
      monthly_volume = parsed_json["monthlyVolume"]
      name = parsed_json["name"]
      if parsed_json["optIn"].nil?
        opt_in = nil
      else
        opt_in = parsed_json["optIn"].to_json
        opt_in = Pinnacle::TollFreeCampaignSchemaOptIn.from_json(json_object: opt_in)
      end
      production_message_content = parsed_json["productionMessageContent"]
      if parsed_json["useCase"].nil?
        use_case = nil
      else
        use_case = parsed_json["useCase"].to_json
        use_case = Pinnacle::TollFreeCampaignSchemaUseCase.from_json(json_object: use_case)
      end
      new(
        brand: brand,
        status: status,
        campaign_id: campaign_id,
        monthly_volume: monthly_volume,
        name: name,
        opt_in: opt_in,
        production_message_content: production_message_content,
        use_case: use_case,
        additional_properties: struct
      )
    end

    # Serialize an instance of TollFreeCampaignWithExtendedBrandAndStatus to a JSON
    #  object
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
      Pinnacle::ExtendedBrand.validate_raw(obj: obj.brand)
      obj.status.is_a?(Pinnacle::ProfileStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.campaign_id&.is_a?(Integer) != false || raise("Passed value for field obj.campaign_id is not the expected type, validation failed.")
      obj.monthly_volume&.is_a?(Pinnacle::MessageVolumeEnum) != false || raise("Passed value for field obj.monthly_volume is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.opt_in.nil? || Pinnacle::TollFreeCampaignSchemaOptIn.validate_raw(obj: obj.opt_in)
      obj.production_message_content&.is_a?(String) != false || raise("Passed value for field obj.production_message_content is not the expected type, validation failed.")
      obj.use_case.nil? || Pinnacle::TollFreeCampaignSchemaUseCase.validate_raw(obj: obj.use_case)
    end
  end
end
