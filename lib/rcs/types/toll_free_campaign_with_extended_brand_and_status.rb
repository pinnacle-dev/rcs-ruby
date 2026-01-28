# frozen_string_literal: true

module Rcs
  module Types
    class TollFreeCampaignWithExtendedBrandAndStatus < Internal::Types::Model
      field :brand, -> { Rcs::Types::ExtendedBrand }, optional: false, nullable: false
      field :status, -> { Rcs::Types::ProfileStatusEnum }, optional: false, nullable: false
      field :campaign_id, -> { String }, optional: false, nullable: false, api_name: "campaignId"
      field :keywords, -> { Rcs::Types::TollFreeWithExtendedBrandAndStatusKeywords }, optional: true, nullable: false
      field :links, -> { Rcs::Types::TollFreeWithExtendedBrandAndStatusLinks }, optional: true, nullable: false
      field :monthly_volume, -> { Rcs::Types::MessageVolumeEnum }, optional: true, nullable: false, api_name: "monthlyVolume"
      field :name, -> { String }, optional: true, nullable: false
      field :opt_in, -> { Rcs::Types::TollFreeWithExtendedBrandAndStatusOptIn }, optional: true, nullable: false, api_name: "optIn"
      field :options, -> { Rcs::Types::TollFreeWithExtendedBrandAndStatusOptions }, optional: true, nullable: false
      field :production_message_content, -> { String }, optional: true, nullable: false, api_name: "productionMessageContent"
      field :use_case, -> { Rcs::Types::TollFreeWithExtendedBrandAndStatusUseCase }, optional: true, nullable: false, api_name: "useCase"
    end
  end
end
