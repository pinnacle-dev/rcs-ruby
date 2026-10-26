# frozen_string_literal: true

module Pinnacle
  module Types
    # Either dial someone (`to` + `from`) or pull in an existing call (`call_id`). `muted` and `whisper_to` can't be
    # combined.
    class AddConferenceParticipantParams < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      member -> { Pinnacle::Types::Dial }

      member -> { Pinnacle::Types::ExistingCallParticipantParams }
    end
  end
end
