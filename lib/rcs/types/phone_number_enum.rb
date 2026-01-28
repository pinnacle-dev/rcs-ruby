# frozen_string_literal: true

module Rcs
  module Types
    module PhoneNumberEnum
      extend Rcs::Internal::Types::Enum

      LANDLINE = "LANDLINE"
      MOBILE = "MOBILE"
      SATELLITE = "SATELLITE"
      PREMIUM = "PREMIUM"
      PAGING = "PAGING"
      SPECIAL = "SPECIAL"
      TOLL_FREE = "TOLL_FREE"
      UNKNOWN = "UNKNOWN"
    end
  end
end
