# frozen_string_literal: true

module Pinnacle
  module Keywords
    module Types
      class KeywordsListRequest < Internal::Types::Model
        field :campaign_type, -> { Pinnacle::Keywords::Types::KeywordsListRequestCampaignType }, optional: true, nullable: false, api_name: "campaignType"

        field :campaign_id, -> { String }, optional: true, nullable: false, api_name: "campaignId"

        field :sender, -> { String }, optional: true, nullable: false

        field :recipient, -> { String }, optional: true, nullable: false

        field :page_index, -> { Integer }, optional: true, nullable: false, api_name: "pageIndex"

        field :page_size, -> { Integer }, optional: true, nullable: false, api_name: "pageSize"
      end
    end
  end
end
