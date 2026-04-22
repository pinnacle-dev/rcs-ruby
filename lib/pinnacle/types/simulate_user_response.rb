# frozen_string_literal: true

module Pinnacle
  module Types
    # Result of the simulation.
    class SimulateUserResponse < Internal::Types::Model
      field :success, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
