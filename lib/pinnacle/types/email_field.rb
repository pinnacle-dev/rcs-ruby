# frozen_string_literal: true

module Pinnacle
  module Types
    # Email input. Server rejects values that fail RFC 5322 validation.
    class EmailField < Internal::Types::Model
      field :placeholder, -> { String }, optional: true, nullable: false
    end
  end
end
