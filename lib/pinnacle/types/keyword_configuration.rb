# frozen_string_literal: true

module Pinnacle
  module Types
    class KeywordConfiguration < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :campaign_type, -> { Pinnacle::Types::KeywordConfigurationCampaignType }, optional: false, nullable: false, api_name: "campaignType"

      field :campaign_id, -> { String }, optional: false, nullable: false, api_name: "campaignId"

      field :sender, -> { String }, optional: false, nullable: true

      field :categories, -> { Pinnacle::Types::KeywordCategories }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
