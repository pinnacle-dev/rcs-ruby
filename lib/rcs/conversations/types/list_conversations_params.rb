# frozen_string_literal: true

module Rcs
  module Conversations
    module Types
      class ListConversationsParams < Internal::Types::Model
        field :brand_id, -> { String }, optional: true, nullable: false, api_name: "brandId"
        field :campaign_id, -> { String }, optional: true, nullable: false, api_name: "campaignId"
        field :campaign_type, -> { Rcs::Types::CampaignEnum }, optional: true, nullable: false, api_name: "campaignType"
        field :page_index, -> { Integer }, optional: false, nullable: false, api_name: "pageIndex"
        field :page_size, -> { Integer }, optional: true, nullable: false, api_name: "pageSize"
        field :receiver, -> { String }, optional: true, nullable: false
        field :sender, -> { String }, optional: true, nullable: false
      end
    end
  end
end
