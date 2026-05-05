# frozen_string_literal: true

module Pinnacle
  module Types
    # Per-mode palette. All three colors are optional; any you omit fall back to the team default for that mode.
    class FormColorPalette < Internal::Types::Model
      field :primary, -> { String }, optional: true, nullable: false

      field :background, -> { String }, optional: true, nullable: false

      field :text, -> { String }, optional: true, nullable: false
    end
  end
end
