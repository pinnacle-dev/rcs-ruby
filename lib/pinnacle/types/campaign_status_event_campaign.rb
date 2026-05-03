# frozen_string_literal: true

module Pinnacle
  module Types
    # Reference to the connected campaign.
    class CampaignStatusEventCampaign < Internal::Types::Model
      field :public_id, -> { String }, optional: false, nullable: true, api_name: "publicId"
      field :type, -> { Pinnacle::Types::CampaignStatusEventCampaignType }, optional: false, nullable: false
    end
  end
end
