# frozen_string_literal: true

module Rcs
  module Types
    # Content type of the message.
    class MessageContent < Internal::Types::Model
      extend Rcs::Internal::Types::Union

      member -> { Rcs::Types::SmsContent }
      member -> { Rcs::Types::MmsContent }
      member -> { Rcs::Types::RcsContent }
      member -> { Rcs::Types::ButtonClicked }
    end
  end
end
