# frozen_string_literal: true

module Rcs
  module Types
    class CampaignValidationResponseErrorsItem < Internal::Types::Model
      field :description, -> { String }, optional: false, nullable: false
      field :example, -> { String }, optional: true, nullable: false
      field :field, -> { String }, optional: false, nullable: false
    end
  end
end
