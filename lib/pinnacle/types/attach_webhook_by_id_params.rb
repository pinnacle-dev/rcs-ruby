# frozen_string_literal: true

module Pinnacle
  module Types
    # Attach a webhook you've already created in your account to this phone number.
    class AttachWebhookByIdParams < Internal::Types::Model
      field :webhook_id, -> { String }, optional: false, nullable: false, api_name: "webhookId"
      field :event, -> { Pinnacle::Types::WebhookEventEnum }, optional: false, nullable: true
    end
  end
end
