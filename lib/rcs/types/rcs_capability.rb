# frozen_string_literal: true

module Rcs
  module Types
    # RCS capabilities for a phone number
    class RcsCapability < Internal::Types::Model
      field :cards, -> { Rcs::Types::RcsCapabilityCards }, optional: false, nullable: false
      field :actions, -> { Rcs::Types::RcsCapabilityActions }, optional: false, nullable: false
    end
  end
end
