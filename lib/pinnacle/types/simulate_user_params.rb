# frozen_string_literal: true

module Pinnacle
  module Types
    # Request body for simulating an inbound event from a user.
    class SimulateUserParams < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      member -> { Pinnacle::Types::SimulateUserMessage }
      member -> { Pinnacle::Types::SimulateUserButton }
    end
  end
end
