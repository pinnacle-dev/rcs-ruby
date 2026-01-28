# frozen_string_literal: true

module Rcs
  module Types
    class ValidationResults < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Rcs::Types::ValidationErrorDetails] }, optional: false, nullable: false
      field :is_valid, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isValid"
    end
  end
end
