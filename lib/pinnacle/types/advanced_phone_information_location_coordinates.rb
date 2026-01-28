# frozen_string_literal: true

module Pinnacle
  module Types
    # Coordinates provide the precise latitude and longitude values for the phone number’s registered location.
    class AdvancedPhoneInformationLocationCoordinates < Internal::Types::Model
      field :latitude, -> { Integer }, optional: false, nullable: true
      field :longitude, -> { Integer }, optional: false, nullable: true
    end
  end
end
