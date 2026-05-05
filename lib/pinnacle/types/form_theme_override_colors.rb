# frozen_string_literal: true

module Pinnacle
  module Types
    # Per-mode palette overrides. Each mode is an object with optional `primary`, `background`, and `text` hex colors.
    # Omit a mode to inherit the team default for it.
    class FormThemeOverrideColors < Internal::Types::Model
      field :light, -> { Pinnacle::Types::FormColorPalette }, optional: true, nullable: false

      field :dark, -> { Pinnacle::Types::FormColorPalette }, optional: true, nullable: false
    end
  end
end
