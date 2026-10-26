# frozen_string_literal: true

module Pinnacle
  module Types
    module ConferenceEndedReason
      extend Pinnacle::Internal::Types::Enum

      EMPTY = "empty"
      ENDED_BY_API = "ended_by_api"
      PARTICIPANT_ENDED_IT = "participant_ended_it"
      TIME_LIMIT = "time_limit"
      EXPIRED_WAITING = "expired_waiting"
      FAILED = "failed"
    end
  end
end
