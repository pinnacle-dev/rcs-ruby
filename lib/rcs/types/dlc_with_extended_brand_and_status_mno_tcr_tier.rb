# frozen_string_literal: true

module Pinnacle
  module Types
    # The MNO TCR message class for AT&T, Verizon, and other carriers. Classes `A`-`G`
    #  are standard (based on vetting score), while `T`, `N`, and `S` are for special
    #  use cases.
    #  See [SMS Rate Limits](/guides/messages/rate-limits) for details.
    class DlcWithExtendedBrandAndStatusMnoTcrTier
      A = "A"
      B = "B"
      C = "C"
      D = "D"
      E = "E"
      F = "F"
      G = "G"
      N = "N"
      T = "T"
      S = "S"
    end
  end
end
