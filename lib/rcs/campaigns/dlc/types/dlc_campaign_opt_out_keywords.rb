# frozen_string_literal: true

module Rcs
  module Campaigns
    module Dlc
      module Types
        # Opt-out keyword settings.
        class DlcCampaignOptOutKeywords < Internal::Types::Model
          field :message, -> { String }, optional: true, nullable: false
          field :values, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        end
      end
    end
  end
end
