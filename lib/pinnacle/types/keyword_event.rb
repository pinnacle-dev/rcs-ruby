# frozen_string_literal: true

module Pinnacle
  module Types
    class KeywordEvent < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :campaign_type, -> { Pinnacle::Types::KeywordEventCampaignType }, optional: false, nullable: false, api_name: "campaignType"

      field :campaign_id, -> { String }, optional: false, nullable: false, api_name: "campaignId"

      field :recipient, -> { String }, optional: false, nullable: false

      field :sender, -> { String }, optional: false, nullable: false

      field :provider_id, -> { Integer }, optional: false, nullable: false, api_name: "providerId"

      field :provider_message_id, -> { String }, optional: false, nullable: false, api_name: "providerMessageId"

      field :category, -> { Pinnacle::Types::KeywordEventCategory }, optional: false, nullable: false

      field :keyword, -> { String }, optional: false, nullable: false

      field :occurred_at, -> { String }, optional: false, nullable: false, api_name: "occurredAt"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :response, -> { String }, optional: false, nullable: false

      field :response_owner, -> { Pinnacle::Types::KeywordEventResponseOwner }, optional: false, nullable: false, api_name: "responseOwner"

      field :reply_message_id, -> { Integer }, optional: false, nullable: true, api_name: "replyMessageId"
    end
  end
end
