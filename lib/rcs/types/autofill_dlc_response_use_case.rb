# frozen_string_literal: true

module Rcs
  module Types
    # Use case for the campaign.
    class AutofillDlcResponseUseCase < Internal::Types::Model
      field :sub, -> { Internal::Types::Array[Rcs::Types::SubUseCaseEnum] }, optional: true, nullable: false
      field :value, -> { Rcs::Types::DlcCampaignUseCaseEnum }, optional: true, nullable: false
    end
  end
end
