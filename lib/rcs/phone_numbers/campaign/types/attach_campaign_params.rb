# frozen_string_literal: true

module Rcs
  module PhoneNumbers
    module Campaign
      module Types
        class AttachCampaignParams < Internal::Types::Model
          field :phones, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :campaign_type, -> { Rcs::Types::MessagingProfileEnum }, optional: false, nullable: false, api_name: "campaignType"
          field :campaign_id, -> { String }, optional: false, nullable: false, api_name: "campaignId"
        end
      end
    end
  end
end
