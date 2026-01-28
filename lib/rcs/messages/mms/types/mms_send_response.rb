# frozen_string_literal: true

module Rcs
  module Messages
    module Mms
      module Types
        class MmsSendResponse < Internal::Types::Model
          extend Rcs::Internal::Types::Union

          member -> { Rcs::Types::SentMmsDetails }
          member -> { Rcs::Types::ScheduledMessage }
        end
      end
    end
  end
end
