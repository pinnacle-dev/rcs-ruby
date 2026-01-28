# frozen_string_literal: true

module Rcs
  module Types
    # Detailed classification including fraud risk and security recommendations.
    class AdvancedPhoneInformationType < Internal::Types::Model
      field :value, -> { Rcs::Types::DetailedPhoneNumberEnum }, optional: false, nullable: false
      field :description, -> { String }, optional: false, nullable: false
      field :details, -> { String }, optional: false, nullable: false
      field :recommendation, -> { Rcs::Types::AdvancedPhoneInformationTypeRecommendation }, optional: false, nullable: false
    end
  end
end
