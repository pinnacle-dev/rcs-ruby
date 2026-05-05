# frozen_string_literal: true

module Pinnacle
  module Types
    # Details of the fallback SMS/MMS message(s) that were actually sent to the recipient instead of the original RCS
    # message.
    #
    # Only present when the message `status` is `FALLBACK_SENT`. The `message.id` on this event refers to the original
    # RCS message that could not be delivered. The `fallbackMessage.ids` contain the identifiers of the actual SMS/MMS
    # messages that were sent.
    class MessageEventFallbackMessage < Internal::Types::Model
      field :ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :type, -> { Pinnacle::Types::MessageEventFallbackMessageType }, optional: false, nullable: false

      field :from, -> { String }, optional: false, nullable: false

      field :to, -> { String }, optional: false, nullable: false

      field :text, -> { String }, optional: true, nullable: false

      field :media_urls, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "mediaUrls"
    end
  end
end
