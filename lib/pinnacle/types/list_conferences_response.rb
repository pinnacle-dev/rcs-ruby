# frozen_string_literal: true

module Pinnacle
  module Types
    class ListConferencesResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Pinnacle::Types::Conference] }, optional: false, nullable: false
    end
  end
end
