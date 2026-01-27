# frozen_string_literal: true

module Rcs
  module Types
    # Geographic coordinates of the location to share.
    class RcsButtonSendLocationLatLong < Internal::Types::Model
      field :lat, -> { Integer }, optional: false, nullable: false
      field :lng, -> { Integer }, optional: false, nullable: false
    end
  end
end
