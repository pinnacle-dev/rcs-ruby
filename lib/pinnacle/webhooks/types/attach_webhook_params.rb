# frozen_string_literal: true

module Pinnacle
  module Webhooks
    module Types
      class AttachWebhookParams < Internal::Types::Model
        field :senders, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        field :webhook_id, -> { String }, optional: true, nullable: false, api_name: "webhookId"
        field :name, -> { String }, optional: true, nullable: false
        field :url, -> { String }, optional: true, nullable: false
        field :event, -> { Pinnacle::Types::WebhookEventEnum }, optional: true, nullable: false
      end
    end
  end
end
