# frozen_string_literal: true

module Rcs
  module Internal
    module Types
      module Unknown
        include Rcs::Internal::Types::Type

        def coerce(value)
          value
        end
      end
    end
  end
end
