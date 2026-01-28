# frozen_string_literal: true

module Pinnacle
  module Types
    # Content of an incoming or outgoing message. Discriminated by the `type` field.
    class MessageEventContent < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      member -> { Pinnacle::Types::MessageEventSmsContent }
      member -> { Pinnacle::Types::MessageEventMmsContent }
      member -> { Pinnacle::Types::MessageEventRcsTextContent }
      member -> { Pinnacle::Types::MessageEventRcsMediaContent }
      member -> { Pinnacle::Types::MessageEventRcsCardsContent }
      member -> { Pinnacle::Types::MessageEventRcsButtonData }
      member -> { Pinnacle::Types::MessageEventRcsLocationData }
    end
  end
end
