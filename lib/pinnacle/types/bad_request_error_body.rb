# frozen_string_literal: true

module Pinnacle
  module Types
    class BadRequestErrorBody < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      member -> { Pinnacle::Types::ZodError }
      member -> { Pinnacle::Types::Error }
    end
  end
end
