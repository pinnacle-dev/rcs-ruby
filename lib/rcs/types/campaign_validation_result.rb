# frozen_string_literal: true

module Rcs
  module Types
    class CampaignValidationResult < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Rcs::Types::CampaignValidationResponseErrorsItem] }, optional: false, nullable: false
      field :is_valid, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
