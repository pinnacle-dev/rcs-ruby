# frozen_string_literal: true

module Pinnacle
  module Types
    class MmsValidationResult < Internal::Types::Model
      field :segments, -> { Pinnacle::Types::MmsValidationResponseSegments }, optional: false, nullable: false
      field :total, -> { Integer }, optional: false, nullable: false
      field :unit, -> { Integer }, optional: false, nullable: false
    end
  end
end
