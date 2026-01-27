# frozen_string_literal: true

module Rcs
  module Types
    # Use case classification for the campaign.
    class TollFreeWithExtendedBrandAndStatusUseCase < Internal::Types::Model
      field :summary, -> { String }, optional: true, nullable: false
      field :value, -> { Rcs::Types::TollFreeCampaignUseCaseEnum }, optional: true, nullable: false
    end
  end
end
