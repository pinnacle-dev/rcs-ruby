# frozen_string_literal: true

module Pinnacle
  module Types
    class ListParticipantsResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Pinnacle::Types::ConferenceParticipant] }, optional: false, nullable: false
    end
  end
end
