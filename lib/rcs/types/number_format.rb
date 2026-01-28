# frozen_string_literal: true

module Rcs
  module Types
    # Multiple formatting representations of the same phone number for different use cases.
    # Provides flexibility for display, storage, and integration requirements.
    class NumberFormat < Internal::Types::Model
      field :international, -> { String }, optional: false, nullable: false
      field :national, -> { String }, optional: false, nullable: false
      field :raw, -> { String }, optional: false, nullable: false
    end
  end
end
