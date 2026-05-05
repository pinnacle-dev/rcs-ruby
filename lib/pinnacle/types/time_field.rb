# frozen_string_literal: true

module Pinnacle
  module Types
    # Time picker. `min`/`max` accept `HH:MM` (24-hour).
    class TimeField < Internal::Types::Model
      field :placeholder, -> { String }, optional: true, nullable: false

      field :min, -> { String }, optional: true, nullable: false

      field :max, -> { String }, optional: true, nullable: false
    end
  end
end
