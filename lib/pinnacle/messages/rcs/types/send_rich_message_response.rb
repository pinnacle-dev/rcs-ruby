# frozen_string_literal: true

module Pinnacle
  module Messages
    module Rcs
      module Types
        class SendRichMessageResponse < Internal::Types::Model
          extend Pinnacle::Internal::Types::Union

          member -> { Pinnacle::Types::SentRichMessage }
          member -> { Pinnacle::Types::ScheduledMessage }
        end
      end
    end
  end
end
