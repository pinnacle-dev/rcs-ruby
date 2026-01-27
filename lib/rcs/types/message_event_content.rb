# frozen_string_literal: true

module Rcs
  module Types
    # Content of an incoming or outgoing message. Discriminated by the `type` field.
    class MessageEventContent < Internal::Types::Model
      extend Rcs::Internal::Types::Union

      member -> { Rcs::Types::MessageEventSmsContent }
      member -> { Rcs::Types::MessageEventMmsContent }
      member -> { Rcs::Types::MessageEventRcsTextContent }
      member -> { Rcs::Types::MessageEventRcsMediaContent }
      member -> { Rcs::Types::MessageEventRcsCardsContent }
      member -> { Rcs::Types::MessageEventRcsButtonData }
      member -> { Rcs::Types::MessageEventRcsLocationData }
    end
  end
end
