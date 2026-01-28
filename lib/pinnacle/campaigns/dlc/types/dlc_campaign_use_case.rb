# frozen_string_literal: true

module Pinnacle
  module Campaigns
    module Dlc
      module Types
        # Use case for the campaign.
        class DlcCampaignUseCase < Internal::Types::Model
          field :sub, -> { Internal::Types::Array[Pinnacle::Types::SubUseCaseEnum] }, optional: true, nullable: false
          field :value, -> { Pinnacle::Types::DlcCampaignUseCaseEnum }, optional: true, nullable: false
        end
      end
    end
  end
end
