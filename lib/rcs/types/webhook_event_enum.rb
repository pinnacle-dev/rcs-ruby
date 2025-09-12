# frozen_string_literal: true

module Pinnacle
  module Types
    # Types of events that can trigger webhook notifications for phone numbers.
    #  Subscribe to specific events to receive real-time updates about your phone
    #  number activity.
    class WebhookEventEnum
      MESSAGE_STATUS = "MESSAGE.STATUS"
      MESSAGE_RECEIVED = "MESSAGE.RECEIVED"
    end
  end
end
