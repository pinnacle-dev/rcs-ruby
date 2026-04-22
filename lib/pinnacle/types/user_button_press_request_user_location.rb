# frozen_string_literal: true

module Pinnacle
  module Types
    # Simulates when a user presses a `requestUserLocation` button.
    class UserButtonPressRequestUserLocation < Internal::Types::Model
      field :title, -> { String }, optional: false, nullable: false
      field :metadata, -> { String }, optional: true, nullable: false
      field :location, -> { Pinnacle::Types::UserButtonPressRequestUserLocationLocation }, optional: true, nullable: false
    end
  end
end
