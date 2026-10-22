# frozen_string_literal: true

module Pinnacle
  module Types
    # Whether the estimate uses an owned business sender and direction. Missing context uses legacy message-type
    # pricing; it is not a sender-specific quote. Estimates exclude number rental, plan, registration and other
    # non-message fees.
    class ValidationPricingContext < Internal::Types::Model
      field :status, -> { Pinnacle::Types::ValidationPricingContextStatus }, optional: false, nullable: false

      field :sender, -> { String }, optional: true, nullable: false

      field :direction, -> { Pinnacle::Types::ValidationPricingContextDirection }, optional: false, nullable: false

      field :category, -> { Pinnacle::Types::ValidationPricingContextCategory }, optional: false, nullable: false
    end
  end
end
