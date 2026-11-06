# frozen_string_literal: true

module Pinnacle
  module Types
    class EffectiveKeywordConfiguration < Internal::Types::Model
      field :campaign_type, -> { Pinnacle::Types::EffectiveKeywordConfigurationCampaignType }, optional: false, nullable: false, api_name: "campaignType"

      field :campaign_id, -> { String }, optional: false, nullable: false, api_name: "campaignId"

      field :sender, -> { String }, optional: false, nullable: false

      field :configuration_id, -> { String }, optional: false, nullable: true, api_name: "configurationId"

      field :source, -> { Pinnacle::Types::EffectiveKeywordConfigurationSource }, optional: false, nullable: false

      field :categories, -> { Pinnacle::Types::KeywordCategories }, optional: false, nullable: false
    end
  end
end
