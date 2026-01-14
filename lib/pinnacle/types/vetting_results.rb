# frozen_string_literal: true

module Pinnacle
  module Types
    class VettingResults < Internal::Types::Model
      field :success, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
