# frozen_string_literal: true

module Rcs
  module Types
    class MmsValidationResult < Internal::Types::Model
      field :segments, -> { Rcs::Types::MmsValidationResponseSegments }, optional: false, nullable: false
      field :total, -> { Integer }, optional: false, nullable: false
      field :unit, -> { Integer }, optional: false, nullable: false
    end
  end
end
