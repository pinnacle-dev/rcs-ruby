# frozen_string_literal: true

module Pinnacle
  module Campaigns
    module TollFree
      module Types
        # Opt-in keyword settings.
        class TollFreeCampaignOptInKeywords < Internal::Types::Model
          field :message, -> { String }, optional: true, nullable: false
          field :keywords, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        end
      end
    end
  end
end
