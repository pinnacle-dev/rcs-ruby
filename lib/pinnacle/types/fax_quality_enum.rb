# frozen_string_literal: true

module Pinnacle
  module Types
    module FaxQualityEnum
      extend Pinnacle::Internal::Types::Enum

      NORMAL = "NORMAL"
      HIGH = "HIGH"
      VERY_HIGH = "VERY_HIGH"
      ULTRA_LIGHT = "ULTRA_LIGHT"
      ULTRA_DARK = "ULTRA_DARK"
    end
  end
end
