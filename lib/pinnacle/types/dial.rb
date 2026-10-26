# frozen_string_literal: true

module Pinnacle
  module Types
    # Dial someone new. This creates a new outbound call, exactly like `POST /calls`.
    class Dial < Internal::Types::Model
      field :to, -> { String }, optional: false, nullable: false

      field :from, -> { String }, optional: false, nullable: false

      field :label, -> { String }, optional: true, nullable: false

      field :muted, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :on_hold, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :whisper_to, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :end_conference_on_leave, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :announce, -> { Pinnacle::Types::ParticipantAnnounce }, optional: true, nullable: false

      field :ring_timeout_secs, -> { Integer }, optional: true, nullable: false

      field :record, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
    end
  end
end
