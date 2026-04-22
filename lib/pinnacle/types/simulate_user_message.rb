# frozen_string_literal: true

module Pinnacle
  module Types
    # Simulate an inbound message from a user.
    class SimulateUserMessage < Internal::Types::Model
      field :from, -> { String }, optional: false, nullable: false
      field :to, -> { String }, optional: false, nullable: false
      field :message, -> { Pinnacle::Types::SimulateMessageInput }, optional: false, nullable: false
    end
  end
end
