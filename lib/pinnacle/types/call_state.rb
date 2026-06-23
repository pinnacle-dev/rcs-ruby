# frozen_string_literal: true

module Pinnacle
  module Types
    module CallState
      extend Pinnacle::Internal::Types::Enum

      INITIATED = "INITIATED"
      RINGING = "RINGING"
      ANSWERED = "ANSWERED"
      BRIDGED = "BRIDGED"
      ENDED = "ENDED"
      FAILED = "FAILED"
      NO_ANSWER = "NO_ANSWER"
      BUSY = "BUSY"
      CANCELED = "CANCELED"
    end
  end
end
