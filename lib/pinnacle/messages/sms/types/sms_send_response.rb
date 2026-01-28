# frozen_string_literal: true

module Pinnacle
  module Messages
    module Sms
      module Types
        class SmsSendResponse < Internal::Types::Model
          extend Pinnacle::Internal::Types::Union

          member -> { Pinnacle::Types::SentSmsDetails }
          member -> { Pinnacle::Types::ScheduledMessage }
        end
      end
    end
  end
end
