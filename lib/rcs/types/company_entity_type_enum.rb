# frozen_string_literal: true

module Rcs
  module Types
    module CompanyEntityTypeEnum
      extend Rcs::Internal::Types::Enum

      LLC = "LLC"
      SOLE_PROPRIETORSHIP = "SOLE_PROPRIETORSHIP"
      PARTNERSHIP = "PARTNERSHIP"
      CORP = "CORP"
      S_CORP = "S_CORP"
    end
  end
end
