# frozen_string_literal: true

module Pinnacle
  module Types
    class TollFreeCampaignWithExtendedBrandAndStatus < Internal::Types::Model
      field :brand, -> { Pinnacle::Types::ExtendedBrand }, optional: false, nullable: false
      field :status, -> { Pinnacle::Types::ProfileStatusEnum }, optional: false, nullable: false
      field :campaign_id, -> { String }, optional: false, nullable: false, api_name: "campaignId"
      field :keywords, -> { Pinnacle::Types::TollFreeWithExtendedBrandAndStatusKeywords }, optional: true, nullable: false
      field :links, -> { Pinnacle::Types::TollFreeWithExtendedBrandAndStatusLinks }, optional: true, nullable: false
      field :monthly_volume, -> { Pinnacle::Types::MessageVolumeEnum }, optional: true, nullable: false, api_name: "monthlyVolume"
      field :name, -> { String }, optional: true, nullable: false
      field :opt_in, -> { Pinnacle::Types::TollFreeWithExtendedBrandAndStatusOptIn }, optional: true, nullable: false, api_name: "optIn"
      field :options, -> { Pinnacle::Types::TollFreeWithExtendedBrandAndStatusOptions }, optional: true, nullable: false
      field :production_message_content, -> { String }, optional: true, nullable: false, api_name: "productionMessageContent"
      field :use_case, -> { Pinnacle::Types::TollFreeWithExtendedBrandAndStatusUseCase }, optional: true, nullable: false, api_name: "useCase"
    end
  end
end
