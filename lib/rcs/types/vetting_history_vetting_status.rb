# frozen_string_literal: true

module Rcs
  module Types
    module VettingHistoryVettingStatus
      extend Rcs::Internal::Types::Enum

      ACTIVE = "ACTIVE"
      FAILED = "FAILED"
      IN_PROGRESS = "IN_PROGRESS"
      PENDING = "PENDING"
    end
  end
end
