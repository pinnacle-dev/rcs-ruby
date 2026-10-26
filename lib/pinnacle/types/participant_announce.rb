# frozen_string_literal: true

module Pinnacle
  module Types
    # Played to a dialed participant when they answer, before they join. Nobody else hears it. If it can't be played,
    # they join without it.
    class ParticipantAnnounce < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      member -> { Pinnacle::Types::Speak }

      member -> { Pinnacle::Types::Play }
    end
  end
end
