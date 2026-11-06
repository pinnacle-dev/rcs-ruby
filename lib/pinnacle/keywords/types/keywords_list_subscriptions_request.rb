# frozen_string_literal: true

module Pinnacle
  module Keywords
    module Types
      class KeywordsListSubscriptionsRequest < Internal::Types::Model
        field :campaign_type, -> { Pinnacle::Keywords::Types::KeywordsListSubscriptionsRequestCampaignType }, optional: true, nullable: false, api_name: "campaignType"

        field :campaign_id, -> { String }, optional: true, nullable: false, api_name: "campaignId"

        field :recipient, -> { String }, optional: true, nullable: false

        field :page_index, -> { Integer }, optional: true, nullable: false, api_name: "pageIndex"

        field :page_size, -> { Integer }, optional: true, nullable: false, api_name: "pageSize"
      end
    end
  end
end
