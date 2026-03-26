# frozen_string_literal: true

module Pinnacle
  module Types
    module MessageSummaryStatus
      extend Pinnacle::Internal::Types::Enum

      PENDING = "PENDING"
      SENT = "SENT"
      SEND_FAILED = "SEND_FAILED"
      DELIVERED = "DELIVERED"
      DELIVERY_FAILED = "DELIVERY_FAILED"
      RECEIVED = "RECEIVED"
      READ = "READ"
      QUEUED = "QUEUED"
      FALLBACK_SENT = "FALLBACK_SENT"
    end
  end
end
