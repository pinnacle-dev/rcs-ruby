# frozen_string_literal: true

module Pinnacle
  module Types
    # Standard error response returned when a request cannot be processed successfully.
    class Error < Internal::Types::Model
      field :error, -> { String }, optional: false, nullable: false
    end
  end
end
