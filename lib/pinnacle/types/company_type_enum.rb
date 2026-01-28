# frozen_string_literal: true

module Pinnacle
  module Types
    module CompanyTypeEnum
      extend Pinnacle::Internal::Types::Enum

      GOVERNMENT = "GOVERNMENT"
      NON_PROFIT = "NON_PROFIT"
      PRIVATE_PROFIT = "PRIVATE_PROFIT"
      PUBLIC_PROFIT = "PUBLIC_PROFIT"
      SOLE_PROPRIETOR = "SOLE_PROPRIETOR"
    end
  end
end
