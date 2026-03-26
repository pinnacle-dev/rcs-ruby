# frozen_string_literal: true

module Pinnacle
  module Types
    module ScheduledMessageSummaryStatus
      extend Pinnacle::Internal::Types::Enum

      ACTIVE = "ACTIVE"
      CANCELLED = "CANCELLED"
      FAILED = "FAILED"
    end
  end
end
