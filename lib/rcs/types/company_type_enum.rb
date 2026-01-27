# frozen_string_literal: true

module Rcs
  module Types
    module CompanyTypeEnum
      extend Rcs::Internal::Types::Enum

      GOVERNMENT = "GOVERNMENT"
      NON_PROFIT = "NON_PROFIT"
      PRIVATE_PROFIT = "PRIVATE_PROFIT"
      PUBLIC_PROFIT = "PUBLIC_PROFIT"
      SOLE_PROPRIETOR = "SOLE_PROPRIETOR"
    end
  end
end
