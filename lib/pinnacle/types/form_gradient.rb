# frozen_string_literal: true

module Pinnacle
  module Types
    # A single light- or dark-mode gradient stop pair.
    class FormGradient < Internal::Types::Model
      field :from, -> { String }, optional: false, nullable: false

      field :to, -> { String }, optional: false, nullable: false

      field :angle, -> { Pinnacle::Types::FormGradientAngle }, optional: false, nullable: false
    end
  end
end
