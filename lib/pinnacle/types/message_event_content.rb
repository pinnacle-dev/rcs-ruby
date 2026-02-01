# frozen_string_literal: true

module Pinnacle
  module Types
    # Content of an incoming or outgoing message. Discriminated by the `type` field.
    class MessageEventContent < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      discriminant :type

      member -> { Pinnacle::Types::MessageEventSmsContent }, key: "SMS"
      member -> { Pinnacle::Types::MessageEventMmsContent }, key: "MMS"
      member -> { Pinnacle::Types::MessageEventRcsTextContent }, key: "RCS_TEXT"
      member -> { Pinnacle::Types::MessageEventRcsMediaContent }, key: "RCS_MEDIA"
      member -> { Pinnacle::Types::MessageEventRcsCardsContent }, key: "RCS_CARDS"
      member -> { Pinnacle::Types::MessageEventRcsButtonData }, key: "RCS_BUTTON_DATA"
      member -> { Pinnacle::Types::MessageEventRcsLocationData }, key: "RCS_LOCATION_DATA"
    end
  end
end
