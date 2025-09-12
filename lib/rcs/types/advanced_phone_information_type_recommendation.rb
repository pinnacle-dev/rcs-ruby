# frozen_string_literal: true

module Pinnacle
  module Types
    # Security recommendation based on fraud risk analysis:
    #  - `ALLOW`: Low risk, safe for normal use.
    #  - `BLOCK`: High risk, block or require additional verification.
    #  - `FLAG`: Medium risk, recommend further scrutiny or monitoring.
    class AdvancedPhoneInformationTypeRecommendation
      ALLOW = "ALLOW"
      BLOCK = "BLOCK"
      FLAG = "FLAG"
    end
  end
end
