# frozen_string_literal: true

module Pinnacle
  module Types
    class DlcCampaignSummary < Internal::Types::Model
      field :campaign_id, -> { String }, optional: false, nullable: false, api_name: "campaignId"
      field :name, -> { String }, optional: true, nullable: false
      field :status, -> { Pinnacle::Types::DlcCampaignSummaryStatus }, optional: false, nullable: false
      field :brand_id, -> { String }, optional: true, nullable: false, api_name: "brandId"
      field :use_case, -> { String }, optional: true, nullable: false, api_name: "useCase"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
