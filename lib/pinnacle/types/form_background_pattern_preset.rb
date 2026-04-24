# frozen_string_literal: true

module Pinnacle
  module Types
    module FormBackgroundPatternPreset
      extend Pinnacle::Internal::Types::Enum

      NOISE = "noise"
      DOTS = "dots"
      MESH = "mesh"
      GRID = "grid"
      WAVES = "waves"
      TOPO = "topo"
    end
  end
end
