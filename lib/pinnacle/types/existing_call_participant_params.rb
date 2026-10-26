# frozen_string_literal: true

module Pinnacle
  module Types
    # Pull in a call your team already has. It must be answered and not in another conference.
    class ExistingCallParticipantParams < Internal::Types::Model
      field :call_id, -> { String }, optional: false, nullable: false

      field :label, -> { String }, optional: true, nullable: false

      field :muted, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :on_hold, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :whisper_to, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :end_conference_on_leave, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
