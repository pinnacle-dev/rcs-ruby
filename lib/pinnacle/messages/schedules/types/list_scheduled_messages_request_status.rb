# frozen_string_literal: true

module Pinnacle
  module Messages
    module Schedules
      module Types
        module ListScheduledMessagesRequestStatus
          extend Pinnacle::Internal::Types::Enum

          ACTIVE = "ACTIVE"
          CANCELLED = "CANCELLED"
          FAILED = "FAILED"
        end
      end
    end
  end
end
