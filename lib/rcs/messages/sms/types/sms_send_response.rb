# frozen_string_literal: true

module Rcs
  module Messages
    module Sms
      module Types
        class SmsSendResponse < Internal::Types::Model
          extend Rcs::Internal::Types::Union

          member -> { Rcs::Types::SentSmsDetails }
          member -> { Rcs::Types::ScheduledMessage }
        end
      end
    end
  end
end
