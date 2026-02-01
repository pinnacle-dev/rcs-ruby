# frozen_string_literal: true

module Pinnacle
  module Types
    # Details of the fallback SMS/MMS message that was sent instead of the original RCS message.
    #
    # This field is only present when the message `status` is `FALLBACK_SENT`, indicating the original RCS message could
    # not be delivered and a fallback message was sent instead.
    #
    # Use this information to track which fallback messages were sent and their content.
    class MessageEventFallbackMessage < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :type, -> { Pinnacle::Types::MessageEventFallbackMessageType }, optional: false, nullable: false
      field :from, -> { String }, optional: false, nullable: false
      field :to, -> { String }, optional: false, nullable: false
      field :text, -> { String }, optional: true, nullable: false
      field :media_urls, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "mediaUrls"
    end
  end
end
