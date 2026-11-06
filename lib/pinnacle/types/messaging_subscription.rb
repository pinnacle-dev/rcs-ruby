# frozen_string_literal: true

module Pinnacle
  module Types
    class MessagingSubscription < Internal::Types::Model
      field :campaign_type, -> { Pinnacle::Types::MessagingSubscriptionCampaignType }, optional: false, nullable: false, api_name: "campaignType"

      field :campaign_id, -> { String }, optional: false, nullable: false, api_name: "campaignId"

      field :recipient, -> { String }, optional: false, nullable: false

      field :status, -> { Pinnacle::Types::MessagingSubscriptionStatus }, optional: false, nullable: false

      field :last_event_at, -> { String }, optional: false, nullable: false, api_name: "lastEventAt"

      field :opted_out_at, -> { String }, optional: false, nullable: true, api_name: "optedOutAt"

      field :opted_in_at, -> { String }, optional: false, nullable: true, api_name: "optedInAt"
    end
  end
end
