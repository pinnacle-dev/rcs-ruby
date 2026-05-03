# frozen_string_literal: true

module Pinnacle
  module Types
    # Reference to the brand owning the agent's connected campaign.
    class CampaignStatusEventBrand < Internal::Types::Model
      field :public_id, -> { String }, optional: false, nullable: true, api_name: "publicId"
      field :name, -> { String }, optional: false, nullable: true
    end
  end
end
