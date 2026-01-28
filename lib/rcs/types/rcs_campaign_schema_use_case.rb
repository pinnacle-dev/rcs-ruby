# frozen_string_literal: true

module Rcs
  module Types
    # Use case classification for the campaign.
    class RcsCampaignSchemaUseCase < Internal::Types::Model
      field :behavior, -> { String }, optional: true, nullable: false
      field :value, -> { Rcs::Types::RcsCampaignUseCaseEnum }, optional: true, nullable: false
    end
  end
end
