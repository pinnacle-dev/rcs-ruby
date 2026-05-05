# frozen_string_literal: true

module Pinnacle
  module Types
    # Single-line text input with optional length bounds and regex pattern.
    class TextField < Internal::Types::Model
      field :placeholder, -> { String }, optional: true, nullable: false

      field :pattern, -> { String }, optional: true, nullable: false

      field :min_length, -> { Integer }, optional: true, nullable: false

      field :max_length, -> { Integer }, optional: true, nullable: false
    end
  end
end
