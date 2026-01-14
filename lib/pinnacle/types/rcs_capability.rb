# frozen_string_literal: true

module Pinnacle
  module Types
    # RCS capabilities for a phone number
    class RcsCapability < Internal::Types::Model
      field :cards, -> { Pinnacle::Types::RcsCapabilityCards }, optional: false, nullable: false
      field :actions, -> { Pinnacle::Types::RcsCapabilityActions }, optional: false, nullable: false
    end
  end
end
