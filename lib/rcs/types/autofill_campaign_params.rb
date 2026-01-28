# frozen_string_literal: true

module Rcs
  module Types
    class AutofillCampaignParams < Internal::Types::Model
      field :additional_info, -> { String }, optional: true, nullable: false, api_name: "additionalInfo"
      field :campaign_id, -> { String }, optional: true, nullable: false, api_name: "campaignId"
    end
  end
end
