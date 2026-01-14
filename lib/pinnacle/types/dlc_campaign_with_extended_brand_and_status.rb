# frozen_string_literal: true

module Pinnacle
  module Types
    # Dlc campaign schema that includes extended brand and status.
    class DlcCampaignWithExtendedBrandAndStatus < Internal::Types::Model
      field :auto_renew, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "autoRenew"
      field :brand, -> { Pinnacle::Types::ExtendedBrand }, optional: false, nullable: false
      field :campaign_id, -> { String }, optional: false, nullable: false, api_name: "campaignId"
      field :description, -> { String }, optional: true, nullable: false
      field :keywords, -> { Pinnacle::Types::DlcWithExtendedBrandAndStatusKeywords }, optional: false, nullable: false
      field :links, -> { Pinnacle::Types::DlcWithExtendedBrandAndStatusLinks }, optional: true, nullable: false
      field :message_flow, -> { String }, optional: true, nullable: false, api_name: "messageFlow"
      field :name, -> { String }, optional: true, nullable: false
      field :options, -> { Pinnacle::Types::DlcWithExtendedBrandAndStatusOptions }, optional: false, nullable: false
      field :sample_messages, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "sampleMessages"
      field :status, -> { Pinnacle::Types::ProfileStatusEnum }, optional: false, nullable: false
      field :use_case, -> { Pinnacle::Types::DlcWithExtendedBrandAndStatusUseCase }, optional: true, nullable: false, api_name: "useCase"
      field :mno_brand_tier, -> { Pinnacle::Types::DlcWithExtendedBrandAndStatusMnoBrandTier }, optional: true, nullable: false, api_name: "mnoBrandTier"
      field :mno_tcr_tier, -> { Pinnacle::Types::DlcWithExtendedBrandAndStatusMnoTcrTier }, optional: true, nullable: false, api_name: "mnoTcrTier"
    end
  end
end
