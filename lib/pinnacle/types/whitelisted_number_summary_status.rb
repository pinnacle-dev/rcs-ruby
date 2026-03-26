# frozen_string_literal: true

module Pinnacle
  module Types
    module WhitelistedNumberSummaryStatus
      extend Pinnacle::Internal::Types::Enum

      ACCEPTED = "ACCEPTED"
      REJECTED = "REJECTED"
      PENDING = "PENDING"
    end
  end
end
