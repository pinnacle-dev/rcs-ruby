# frozen_string_literal: true

module Pinnacle
  module Campaigns
    module Dlc
      module Types
        # Opt-in keyword settings.
        class DlcCampaignOptInKeywords < Internal::Types::Model
          field :message, -> { String }, optional: true, nullable: false
          field :values, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        end
      end
    end
  end
end
