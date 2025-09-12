# frozen_string_literal: true

module Pinnacle
  module Types
    # The classification of the phone number based on its service type. <br>
    #  Determines the billing, usage, and routing characteristics.
    class PhoneNumberEnum
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
