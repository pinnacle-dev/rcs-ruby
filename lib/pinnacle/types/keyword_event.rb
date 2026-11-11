# frozen_string_literal: true

module Pinnacle
  module Types
    class KeywordEvent < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :campaign_type, -> { Pinnacle::Types::KeywordEventCampaignType }, optional: false, nullable: false, api_name: "campaignType"

      field :campaign_id, -> { String }, optional: false, nullable: false, api_name: "campaignId"

      field :recipient, -> { String }, optional: false, nullable: false

      field :sender, -> { String }, optional: false, nullable: false

      field :category, -> { Pinnacle::Types::KeywordEventCategory }, optional: false, nullable: false

      field :keyword, -> { String }, optional: false, nullable: false

      field :occurred_at, -> { String }, optional: false, nullable: false, api_name: "occurredAt"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :response_media_urls, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "responseMediaUrls"

      field :response, -> { String }, optional: false, nullable: false


      field :reply_message_id, -> { String }, optional: false, nullable: true, api_name: "replyMessageId"
    end
  end
end
