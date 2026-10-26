# frozen_string_literal: true

module Pinnacle
  module Types
    module ParticipantStatus
      extend Pinnacle::Internal::Types::Enum

      DIALING = "dialing"
      RINGING = "ringing"
      JOINED = "joined"
      LEFT = "left"
      FAILED = "failed"
    end
  end
end
