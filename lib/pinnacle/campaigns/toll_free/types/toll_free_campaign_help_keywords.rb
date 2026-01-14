# frozen_string_literal: true

module Pinnacle
  module Campaigns
    module TollFree
      module Types
        # Help keyword settings.
        class TollFreeCampaignHelpKeywords < Internal::Types::Model
          field :message, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
