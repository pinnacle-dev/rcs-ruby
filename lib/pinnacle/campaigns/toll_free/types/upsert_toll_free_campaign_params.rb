# frozen_string_literal: true

module Pinnacle
  module Campaigns
    module TollFree
      module Types
        class UpsertTollFreeCampaignParams < Internal::Types::Model
          field :brand, -> { String }, optional: true, nullable: false
          field :campaign_id, -> { String }, optional: true, nullable: false, api_name: "campaignId"
          field :keywords, -> { Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignKeywords }, optional: true, nullable: false
          field :links, -> { Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignLinks }, optional: true, nullable: false
          field :monthly_volume, -> { Pinnacle::Types::MessageVolumeEnum }, optional: true, nullable: false, api_name: "monthlyVolume"
          field :name, -> { String }, optional: true, nullable: false
          field :opt_in, -> { Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignOptIn }, optional: true, nullable: false, api_name: "optIn"
          field :options, -> { Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignOptions }, optional: true, nullable: false
          field :production_message_content, -> { String }, optional: true, nullable: false, api_name: "productionMessageContent"
          field :use_case, -> { Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignUseCase }, optional: true, nullable: false, api_name: "useCase"
        end
      end
    end
  end
end
