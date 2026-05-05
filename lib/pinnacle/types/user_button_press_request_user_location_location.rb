# frozen_string_literal: true

module Pinnacle
  module Types
    # Location the simulated user responded with.
    class UserButtonPressRequestUserLocationLocation < Internal::Types::Model
      field :text, -> { String }, optional: true, nullable: false

      field :latitude, -> { Integer }, optional: true, nullable: false

      field :longitude, -> { Integer }, optional: true, nullable: false

      field :address, -> { String }, optional: true, nullable: false
    end
  end
end
