# frozen_string_literal: true

module Pinnacle
  module Conferences
    module Participants
      module Types
        class UpdateConferenceParticipantParams < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :participant, -> { String }, optional: false, nullable: false

          field :label, -> { String }, optional: true, nullable: false

          field :muted, -> { Internal::Types::Boolean }, optional: true, nullable: false

          field :on_hold, -> { Internal::Types::Boolean }, optional: true, nullable: false

          field :whisper_to, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        end
      end
    end
  end
end
