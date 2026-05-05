# frozen_string_literal: true

module Pinnacle
  module Types
    # Numeric input with optional `min` / `max` bounds and `step` granularity.
    class NumberField < Internal::Types::Model
      field :placeholder, -> { String }, optional: true, nullable: false

      field :min, -> { Integer }, optional: true, nullable: false

      field :max, -> { Integer }, optional: true, nullable: false

      field :step, -> { Integer }, optional: true, nullable: false
    end
  end
end
