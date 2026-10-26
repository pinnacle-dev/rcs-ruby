# frozen_string_literal: true

module Pinnacle
  module Conferences
    module Types
      class UpdateConferenceParams < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :label, -> { String }, optional: true, nullable: false

        field :hold_audio_url, -> { String }, optional: true, nullable: false

        field :speaking_events, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      end
    end
  end
end
