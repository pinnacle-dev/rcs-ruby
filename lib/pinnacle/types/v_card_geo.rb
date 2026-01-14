# frozen_string_literal: true

module Pinnacle
  module Types
    # Geographic coordinates.
    class VCardGeo < Internal::Types::Model
      field :latitude, -> { Integer }, optional: true, nullable: false
      field :longitude, -> { Integer }, optional: true, nullable: false
    end
  end
end
