# frozen_string_literal: true

module Pinnacle
  module Webhooks
    module Types
      class DetachWebhookParams < Internal::Types::Model
        field :webhook_id, -> { String }, optional: false, nullable: false, api_name: "webhookId"

        field :senders, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      end
    end
  end
end
