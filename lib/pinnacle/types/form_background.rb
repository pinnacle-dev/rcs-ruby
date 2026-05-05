# frozen_string_literal: true

module Pinnacle
  module Types
    # Background layer for the form page. Discriminated by `type`.
    class FormBackground < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      discriminant :type

      member -> { Pinnacle::Types::FormBackgroundSolid }, key: "SOLID"

      member -> { Pinnacle::Types::FormBackgroundGradient }, key: "GRADIENT"

      member -> { Pinnacle::Types::FormBackgroundImage }, key: "IMAGE"

      member -> { Pinnacle::Types::FormBackgroundPattern }, key: "PATTERN"
    end
  end
end
