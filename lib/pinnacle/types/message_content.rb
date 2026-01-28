# frozen_string_literal: true

module Pinnacle
  module Types
    # Content type of the message.
    class MessageContent < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      member -> { Pinnacle::Types::SmsContent }
      member -> { Pinnacle::Types::MmsContent }
      member -> { Pinnacle::Types::RcsContent }
      member -> { Pinnacle::Types::ButtonClicked }
    end
  end
end
