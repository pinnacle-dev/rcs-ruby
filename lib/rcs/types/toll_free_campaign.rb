# frozen_string_literal: true

module Rcs
  module Types
    class TollFreeCampaign < Internal::Types::Model
      field :campaign_id, -> { String }, optional: true, nullable: false, api_name: "campaignId"
      field :keywords, -> { Rcs::Types::TollFreeCampaignSchemaKeywords }, optional: true, nullable: false
      field :links, -> { Rcs::Types::TollFreeCampaignSchemaLinks }, optional: true, nullable: false
      field :monthly_volume, -> { Rcs::Types::MessageVolumeEnum }, optional: true, nullable: false, api_name: "monthlyVolume"
      field :name, -> { String }, optional: true, nullable: false
      field :opt_in, -> { Rcs::Types::TollFreeCampaignSchemaOptIn }, optional: true, nullable: false, api_name: "optIn"
      field :options, -> { Rcs::Types::TollFreeCampaignSchemaOptions }, optional: true, nullable: false
      field :production_message_content, -> { String }, optional: true, nullable: false, api_name: "productionMessageContent"
      field :use_case, -> { Rcs::Types::TollFreeCampaignSchemaUseCase }, optional: true, nullable: false, api_name: "useCase"
    end
  end
end
