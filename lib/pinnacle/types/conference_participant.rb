# frozen_string_literal: true

module Pinnacle
  module Types
    # A call in a conference.
    class ConferenceParticipant < Internal::Types::Model
      field :call_id, -> { String }, optional: false, nullable: false

      field :conference_id, -> { String }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: true

      field :status, -> { Pinnacle::Types::ParticipantStatus }, optional: false, nullable: false

      field :from, -> { String }, optional: false, nullable: true

      field :to, -> { String }, optional: false, nullable: true

      field :muted, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :on_hold, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :whisper_to, -> { Internal::Types::Array[String] }, optional: false, nullable: true

      field :end_conference_on_leave, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :joined_at, -> { String }, optional: false, nullable: true

      field :left_at, -> { String }, optional: false, nullable: true

      field :left_reason, -> { Pinnacle::Types::ParticipantLeftReason }, optional: false, nullable: true
    end
  end
end
