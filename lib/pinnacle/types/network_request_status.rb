# frozen_string_literal: true

module Pinnacle
  module Types
    module NetworkRequestStatus
      extend Pinnacle::Internal::Types::Enum

      STARTED = "started"
      CHALLENGE_ISSUED = "challenge-issued"
      COMPLETED = "completed"
      FAILED = "failed"
      EXPIRED = "expired"
    end
  end
end
