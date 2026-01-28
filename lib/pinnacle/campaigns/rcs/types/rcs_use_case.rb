# frozen_string_literal: true

module Pinnacle
  module Campaigns
    module Rcs
      module Types
        # Use case classification for the campaign.
        class RcsUseCase < Internal::Types::Model
          field :behavior, -> { String }, optional: true, nullable: false
          field :value, -> { Pinnacle::Types::RcsCampaignUseCaseEnum }, optional: true, nullable: false
        end
      end
    end
  end
end
