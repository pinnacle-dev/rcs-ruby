# frozen_string_literal: true

module Pinnacle
  module Campaigns
    module Dlc
      module Types
        class UpsertDlcCampaignParams < Internal::Types::Model
          field :auto_renew, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "autoRenew"
          field :brand, -> { String }, optional: true, nullable: false
          field :campaign_id, -> { String }, optional: true, nullable: false, api_name: "campaignId"
          field :description, -> { String }, optional: true, nullable: false
          field :keywords, -> { Pinnacle::Campaigns::Dlc::Types::DlcCampaignKeywords }, optional: true, nullable: false
          field :links, -> { Pinnacle::Campaigns::Dlc::Types::DlcCampaignLinks }, optional: true, nullable: false
          field :message_flow, -> { String }, optional: true, nullable: false, api_name: "messageFlow"
          field :name, -> { String }, optional: true, nullable: false
          field :options, -> { Pinnacle::Campaigns::Dlc::Types::DlcCampaignOptions }, optional: true, nullable: false
          field :sample_messages, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "sampleMessages"
          field :use_case, -> { Pinnacle::Campaigns::Dlc::Types::DlcCampaignUseCase }, optional: true, nullable: false, api_name: "useCase"
        end
      end
    end
  end
end
