# frozen_string_literal: true

module Rcs
  module Messages
    module Rcs
      module Types
        class SendRichMessageResponse < Internal::Types::Model
          extend Rcs::Internal::Types::Union

          member -> { Rcs::Types::SentRichMessage }
          member -> { Rcs::Types::ScheduledMessage }
        end
      end
    end
  end
end
