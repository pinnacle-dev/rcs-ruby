# frozen_string_literal: true

module Rcs
  module Types
    class RcsCapabilityCards < Internal::Types::Model
      field :standalone, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :carousel, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
