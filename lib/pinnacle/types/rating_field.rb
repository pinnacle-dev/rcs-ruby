# frozen_string_literal: true

module Pinnacle
  module Types
    # Star rating 1..`max`. Submitted value is the selected integer.
    class RatingField < Internal::Types::Model
      field :min, -> { Integer }, optional: true, nullable: false

      field :max, -> { Integer }, optional: true, nullable: false
    end
  end
end
