# frozen_string_literal: true

module Pinnacle
  module Types
    class ValidateCampaignParams < Internal::Types::Model
      field :additional_info, -> { String }, optional: true, nullable: false, api_name: "additionalInfo"
      field :campaign_id, -> { String }, optional: false, nullable: false, api_name: "campaignId"
    end
  end
end
