# frozen_string_literal: true

module Pinnacle
  module Types
    # Subtle repeating SVG pattern tinted by the palette's foreground color.
    class FormBackgroundPattern < Internal::Types::Model
      field :preset, -> { Pinnacle::Types::FormBackgroundPatternPreset }, optional: false, nullable: false
    end
  end
end
