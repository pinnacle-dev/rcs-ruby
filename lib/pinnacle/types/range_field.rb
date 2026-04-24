# frozen_string_literal: true

module Pinnacle
  module Types
    # Slider input. `min`/`max` define the bounds, `step` the granularity.
    class RangeField < Internal::Types::Model
      field :min, -> { Integer }, optional: true, nullable: false
      field :max, -> { Integer }, optional: true, nullable: false
      field :step, -> { Integer }, optional: true, nullable: false
    end
  end
end
