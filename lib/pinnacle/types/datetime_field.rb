# frozen_string_literal: true

module Pinnacle
  module Types
    # Local-datetime picker. `min`/`max` accept ISO 8601 timestamps.
    class DatetimeField < Internal::Types::Model
      field :placeholder, -> { String }, optional: true, nullable: false

      field :min, -> { String }, optional: true, nullable: false

      field :max, -> { String }, optional: true, nullable: false
    end
  end
end
