# frozen_string_literal: true

module Pinnacle
  module Types
    # The MNO brand tier for T-Mobile rate limits. Tiers range from `TOP` (highest) to
    #  `LOW` (lowest), based on your brand's vetting score.
    #  See [SMS Rate Limits](/guides/messages/rate-limits) for details.
    class DlcWithExtendedBrandAndStatusMnoBrandTier
      TOP = "TOP"
      HIGH_MID = "HIGH_MID"
      LOW_MID = "LOW_MID"
      LOW = "LOW"
    end
  end
end
