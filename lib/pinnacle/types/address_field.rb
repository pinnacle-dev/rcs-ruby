# frozen_string_literal: true

module Pinnacle
  module Types
    # Free-form text input backed by a client-side Google Places autocomplete. Shares text-field validation (length /
    # pattern); the place lookup happens entirely in the browser and is purely for suggestion UX.
    class AddressField < Internal::Types::Model
      field :placeholder, -> { String }, optional: true, nullable: false

      field :pattern, -> { String }, optional: true, nullable: false

      field :min_length, -> { Integer }, optional: true, nullable: false

      field :max_length, -> { Integer }, optional: true, nullable: false
    end
  end
end
