# frozen_string_literal: true

module Pinnacle
  module Types
    # Date picker. `min`/`max` accept `YYYY-MM-DD`.
    class DateField < Internal::Types::Model
      field :placeholder, -> { String }, optional: true, nullable: false

      field :min, -> { String }, optional: true, nullable: false

      field :max, -> { String }, optional: true, nullable: false
    end
  end
end
