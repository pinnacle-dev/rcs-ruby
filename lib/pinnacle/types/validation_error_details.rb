# frozen_string_literal: true

module Pinnacle
  module Types
    class ValidationErrorDetails < Internal::Types::Model
      field :description, -> { String }, optional: false, nullable: false
      field :example, -> { String }, optional: true, nullable: false
      field :field, -> { String }, optional: false, nullable: false
    end
  end
end
