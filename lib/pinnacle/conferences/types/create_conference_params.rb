# frozen_string_literal: true

module Pinnacle
  module Conferences
    module Types
      class CreateConferenceParams < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: true, nullable: false, api_name: "Idempotency-Key"

        field :label, -> { String }, optional: true, nullable: false

        field :max_participants, -> { Integer }, optional: true, nullable: false

        field :hold_audio_url, -> { String }, optional: true, nullable: false

        field :speaking_events, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false

        field :participants, -> { Internal::Types::Array[Pinnacle::Types::AddConferenceParticipantParams] }, optional: true, nullable: false
      end
    end
  end
end
