# frozen_string_literal: true

module Pinnacle
  module Internal
    module Types
      module Unknown
        include Pinnacle::Internal::Types::Type

        def coerce(value)
          value
        end
      end
    end
  end
end
