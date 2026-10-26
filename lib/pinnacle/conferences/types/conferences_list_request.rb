# frozen_string_literal: true

module Pinnacle
  module Conferences
    module Types
      class ConferencesListRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :status, -> { Pinnacle::Types::ConferenceStatus }, optional: true, nullable: false
      end
    end
  end
end
