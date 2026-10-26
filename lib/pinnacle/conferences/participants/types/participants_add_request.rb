# frozen_string_literal: true

module Pinnacle
  module Conferences
    module Participants
      module Types
        class ParticipantsAddRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :idempotency_key, -> { String }, optional: true, nullable: false, api_name: "Idempotency-Key"

          field :body, -> { Pinnacle::Types::AddConferenceParticipantParams }, optional: false, nullable: false
        end
      end
    end
  end
end
