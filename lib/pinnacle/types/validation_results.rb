# frozen_string_literal: true

module Pinnacle
  module Types
    class ValidationResults < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Pinnacle::Types::ValidationErrorDetails] }, optional: false, nullable: false
      field :is_valid, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isValid"
    end
  end
end
