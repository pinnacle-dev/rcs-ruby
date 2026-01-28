# frozen_string_literal: true

module Pinnacle
  module Types
    class TollFreeCampaign < Internal::Types::Model
      field :campaign_id, -> { String }, optional: true, nullable: false, api_name: "campaignId"
      field :keywords, -> { Pinnacle::Types::TollFreeCampaignSchemaKeywords }, optional: true, nullable: false
      field :links, -> { Pinnacle::Types::TollFreeCampaignSchemaLinks }, optional: true, nullable: false
      field :monthly_volume, -> { Pinnacle::Types::MessageVolumeEnum }, optional: true, nullable: false, api_name: "monthlyVolume"
      field :name, -> { String }, optional: true, nullable: false
      field :opt_in, -> { Pinnacle::Types::TollFreeCampaignSchemaOptIn }, optional: true, nullable: false, api_name: "optIn"
      field :options, -> { Pinnacle::Types::TollFreeCampaignSchemaOptions }, optional: true, nullable: false
      field :production_message_content, -> { String }, optional: true, nullable: false, api_name: "productionMessageContent"
      field :use_case, -> { Pinnacle::Types::TollFreeCampaignSchemaUseCase }, optional: true, nullable: false, api_name: "useCase"
    end
  end
end
