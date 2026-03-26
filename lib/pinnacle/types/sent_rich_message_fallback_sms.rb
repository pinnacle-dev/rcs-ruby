# frozen_string_literal: true

module Pinnacle
  module Types
    # Returned when a fallback is configured and the recipient does not support RCS. The API checks RCS capabilities at
    # send time. If the recipient's device doesn't support RCS, the fallback SMS is sent instead. You will also receive
    # a `FALLBACK_SENT` webhook event for the original RCS message.
    class SentRichMessageFallbackSms < Internal::Types::Model
      field :fallback_sent, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "fallbackSent"
      field :original_message_id, -> { String }, optional: false, nullable: false, api_name: "originalMessageId"
    end
  end
end
