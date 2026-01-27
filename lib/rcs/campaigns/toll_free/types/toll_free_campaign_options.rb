# frozen_string_literal: true

module Rcs
  module Campaigns
    module TollFree
      module Types
        # Campaign configuration options.
        class TollFreeCampaignOptions < Internal::Types::Model
          field :age_gated, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "ageGated"
        end
      end
    end
  end
end
