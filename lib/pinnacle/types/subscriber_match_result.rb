# frozen_string_literal: true

module Pinnacle
  module Types
    module SubscriberMatchResult
      extend Pinnacle::Internal::Types::Enum

      EXACT = "exact"
      HIGH = "high"
      PARTIAL = "partial"
      LOW = "low"
      NONE = "none"
      UNAVAILABLE = "unavailable"
      INCLUDED_WITH_ADDRESS_MATCH = "included-with-address-match"
      UNKNOWN = "unknown"
    end
  end
end
