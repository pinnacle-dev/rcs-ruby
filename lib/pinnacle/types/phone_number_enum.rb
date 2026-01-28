# frozen_string_literal: true

module Pinnacle
  module Types
    module PhoneNumberEnum
      extend Pinnacle::Internal::Types::Enum

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
