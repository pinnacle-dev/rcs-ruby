# frozen_string_literal: true

module Pinnacle
  module Types
    class RcsCampaignSummary < Internal::Types::Model
      field :campaign_id, -> { String }, optional: false, nullable: false, api_name: "campaignId"

      field :name, -> { String }, optional: true, nullable: false

      field :status, -> { Pinnacle::Types::RcsCampaignSummaryStatus }, optional: false, nullable: false

      field :brand_id, -> { String }, optional: true, nullable: false, api_name: "brandId"

      field :agent_id, -> { String }, optional: true, nullable: false, api_name: "agentId"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
