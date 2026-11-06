# frozen_string_literal: true

module Pinnacle
  module Keywords
    module Types
      class CreateKeywordConfiguration < Internal::Types::Model
        field :campaign_type, -> { Pinnacle::Keywords::Types::CreateKeywordConfigurationCampaignType }, optional: false, nullable: false, api_name: "campaignType"

        field :campaign_id, -> { String }, optional: false, nullable: false, api_name: "campaignId"

        field :sender, -> { String }, optional: true, nullable: false

        field :categories, -> { Pinnacle::Types::KeywordCategories }, optional: false, nullable: false
      end
    end
  end
end
