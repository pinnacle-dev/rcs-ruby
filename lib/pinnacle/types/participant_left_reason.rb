# frozen_string_literal: true

module Pinnacle
  module Types
    module ParticipantLeftReason
      extend Pinnacle::Internal::Types::Enum

      HANGUP = "hangup"
      REMOVED = "removed"
      BUSY = "busy"
      NO_ANSWER = "no_answer"
      REJECTED = "rejected"
      FAILED = "failed"
      CONFERENCE_ENDED = "conference_ended"
    end
  end
end
