# frozen_string_literal: true

module Pinnacle
  module Types
    # Two-stop linear gradient. Supply separate light- and dark-mode gradients; the renderer picks based on
    # `theme_mode`.
    class FormBackgroundGradient < Internal::Types::Model
      field :light, -> { Pinnacle::Types::FormGradient }, optional: false, nullable: false

      field :dark, -> { Pinnacle::Types::FormGradient }, optional: false, nullable: false
    end
  end
end
