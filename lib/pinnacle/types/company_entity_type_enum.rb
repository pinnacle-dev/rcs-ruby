# frozen_string_literal: true

module Pinnacle
  module Types
    module CompanyEntityTypeEnum
      extend Pinnacle::Internal::Types::Enum

      LLC = "LLC"
      SOLE_PROPRIETORSHIP = "SOLE_PROPRIETORSHIP"
      PARTNERSHIP = "PARTNERSHIP"
      CORP = "CORP"
      S_CORP = "S_CORP"
    end
  end
end
