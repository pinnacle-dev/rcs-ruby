# frozen_string_literal: true

module Pinnacle
  module Messages
    module Mms
      module Types
        class MmsSendResponse < Internal::Types::Model
          extend Pinnacle::Internal::Types::Union

          member -> { Pinnacle::Types::SentMmsDetails }
          member -> { Pinnacle::Types::ScheduledMessage }
        end
      end
    end
  end
end
