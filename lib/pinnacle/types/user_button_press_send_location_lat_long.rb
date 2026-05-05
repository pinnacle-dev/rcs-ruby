# frozen_string_literal: true

module Pinnacle
  module Types
    # Shared coordinates.
    class UserButtonPressSendLocationLatLong < Internal::Types::Model
      field :lat, -> { Integer }, optional: true, nullable: false

      field :lng, -> { Integer }, optional: true, nullable: false
    end
  end
end
