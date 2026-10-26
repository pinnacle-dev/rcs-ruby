# frozen_string_literal: true

module Pinnacle
  module Types
    module NetworkInsightStatus
      extend Pinnacle::Internal::Types::Enum

      AVAILABLE = "available"
      UNAVAILABLE = "unavailable"
      UNSUPPORTED = "unsupported"
      FAILED = "failed"
    end
  end
end
