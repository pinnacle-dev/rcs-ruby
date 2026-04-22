# frozen_string_literal: true

module Pinnacle
  module Types
    # Simulate a button press from a user.
    class SimulateUserButton < Internal::Types::Model
      field :from, -> { String }, optional: false, nullable: false
      field :to, -> { String }, optional: false, nullable: false
      field :button, -> { Pinnacle::Types::UserButtonPress }, optional: false, nullable: false
    end
  end
end
