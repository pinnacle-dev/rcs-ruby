# frozen_string_literal: true

module Pinnacle
  module Types
    class KeywordReceivedEvent < MessageEvent
      class Keyword < Internal::Types::Model
        field :value, -> { String }
        field :category, -> { KeywordEventCategory }
        field :campaign_type, -> { KeywordEventCampaignType }, api_name: "campaignType"
        field :campaign_id, -> { String }, api_name: "campaignId"
      end

      class Consent < Internal::Types::Model
        field :status, -> { String }, nullable: true
        field :applied, -> { Internal::Types::Boolean }
      end

      class Reply < Internal::Types::Model
        field :status, -> { String }
        field :message_id, -> { String }, nullable: true, api_name: "messageId"
        field :type, -> { String }, nullable: true
        field :text, -> { String }, nullable: true
        field :media_urls, -> { Internal::Types::Array[String] }, api_name: "mediaUrls"
        field :reason, -> { String }, nullable: true
      end

      literal :type, "KEYWORD.RECEIVED"
      literal :direction, "INBOUND"
      literal :status, "RECEIVED"
      field :id, -> { String }
      field :created_at, -> { String }, api_name: "createdAt"
      field :delivered_at, -> { String }, nullable: true, api_name: "deliveredAt"
      field :keyword, -> { Keyword }
      field :consent, -> { Consent }
      field :reply, -> { Reply }
    end
  end
end
