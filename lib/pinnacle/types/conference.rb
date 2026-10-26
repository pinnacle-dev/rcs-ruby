# frozen_string_literal: true

module Pinnacle
  module Types
    class Conference < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: true

      field :status, -> { Pinnacle::Types::ConferenceStatus }, optional: false, nullable: false

      field :participant_count, -> { Integer }, optional: false, nullable: false

      field :max_participants, -> { Integer }, optional: false, nullable: false

      field :hold_audio_url, -> { String }, optional: false, nullable: true

      field :speaking_events, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :started_at, -> { String }, optional: false, nullable: true

      field :ended_at, -> { String }, optional: false, nullable: true

      field :ended_reason, -> { Pinnacle::Types::ConferenceEndedReason }, optional: false, nullable: true

      field :participants, -> { Internal::Types::Array[Pinnacle::Types::ConferenceParticipant] }, optional: false, nullable: false
    end
  end
end
