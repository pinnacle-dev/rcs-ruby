# frozen_string_literal: true

module Pinnacle
  module Types
    # Use case classification for the campaign.
    class TollFreeCampaignSchemaUseCase < Internal::Types::Model
      field :summary, -> { String }, optional: true, nullable: false
      field :value, -> { Pinnacle::Types::TollFreeCampaignUseCaseEnum }, optional: true, nullable: false
    end
  end
end
