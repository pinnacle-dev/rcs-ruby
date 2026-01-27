# frozen_string_literal: true

module Rcs
  module Types
    # Dlc campaign schema that includes extended brand and status.
    class DlcCampaignWithExtendedBrandAndStatus < Internal::Types::Model
      field :auto_renew, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "autoRenew"
      field :brand, -> { Rcs::Types::ExtendedBrand }, optional: false, nullable: false
      field :campaign_id, -> { String }, optional: false, nullable: false, api_name: "campaignId"
      field :description, -> { String }, optional: true, nullable: false
      field :keywords, -> { Rcs::Types::DlcWithExtendedBrandAndStatusKeywords }, optional: false, nullable: false
      field :links, -> { Rcs::Types::DlcWithExtendedBrandAndStatusLinks }, optional: true, nullable: false
      field :message_flow, -> { String }, optional: true, nullable: false, api_name: "messageFlow"
      field :name, -> { String }, optional: true, nullable: false
      field :options, -> { Rcs::Types::DlcWithExtendedBrandAndStatusOptions }, optional: false, nullable: false
      field :sample_messages, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "sampleMessages"
      field :status, -> { Rcs::Types::ProfileStatusEnum }, optional: false, nullable: false
      field :use_case, -> { Rcs::Types::DlcWithExtendedBrandAndStatusUseCase }, optional: true, nullable: false, api_name: "useCase"
      field :mno_brand_tier, -> { Rcs::Types::DlcWithExtendedBrandAndStatusMnoBrandTier }, optional: true, nullable: false, api_name: "mnoBrandTier"
      field :mno_tcr_tier, -> { Rcs::Types::DlcWithExtendedBrandAndStatusMnoTcrTier }, optional: true, nullable: false, api_name: "mnoTcrTier"
    end
  end
end
