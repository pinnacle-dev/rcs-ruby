# frozen_string_literal: true

module Pinnacle
  module Types
    # Use this request to connect a webhook to your phone number and receive real-time event notifications.
    # You can either attach one of your existing webhooks by providing its ID or create a new webhook by specifying its
    # name, URL, and event type.
    class AttachWebhookParams < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      member -> { Pinnacle::Types::AttachWebhookByIdParams }
      member -> { Pinnacle::Types::CreateAndAttachWebhookByUrlParams }
    end
  end
end
