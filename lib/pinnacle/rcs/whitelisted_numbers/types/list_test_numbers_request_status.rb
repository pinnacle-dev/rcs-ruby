# frozen_string_literal: true

module Pinnacle
  module Rcs
    module WhitelistedNumbers
      module Types
        module ListTestNumbersRequestStatus
          extend Pinnacle::Internal::Types::Enum

          ACCEPTED = "ACCEPTED"
          REJECTED = "REJECTED"
          PENDING = "PENDING"
        end
      end
    end
  end
end
