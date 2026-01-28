# frozen_string_literal: true

module Pinnacle
  module Types
    module VettingHistoryVettingStatus
      extend Pinnacle::Internal::Types::Enum

      ACTIVE = "ACTIVE"
      FAILED = "FAILED"
      IN_PROGRESS = "IN_PROGRESS"
      PENDING = "PENDING"
    end
  end
end
