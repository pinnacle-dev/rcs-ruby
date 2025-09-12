# frozen_string_literal: true

module Pinnacle
  module Types
    # Current status of the vetting process.
    class VettingHistoryVettingStatus
      ACTIVE = "ACTIVE"
      FAILED = "FAILED"
      IN_PROGRESS = "IN_PROGRESS"
      PENDING = "PENDING"
    end
  end
end
