# frozen_string_literal: true

module Pinnacle
  module Types
    module ConferenceStatus
      extend Pinnacle::Internal::Types::Enum

      WAITING = "waiting"
      ACTIVE = "active"
      ENDED = "ended"
    end
  end
end
