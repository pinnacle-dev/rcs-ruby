# frozen_string_literal: true

module Rcs
  module Types
    class BadRequestErrorBody < Internal::Types::Model
      extend Rcs::Internal::Types::Union

      member -> { Rcs::Types::ZodError }
      member -> { Rcs::Types::Error }
    end
  end
end
