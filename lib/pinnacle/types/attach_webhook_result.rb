# frozen_string_literal: true

module Pinnacle
  module Types
    class AttachWebhookResult < Internal::Types::Model
      field :webhook, -> { Pinnacle::Types::AttachWebhookResponseWebhook }, optional: false, nullable: false
      field :event, -> { Pinnacle::Types::WebhookEventEnum }, optional: false, nullable: true
      field :senders, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      field :failed, -> { Internal::Types::Array[Pinnacle::Types::FailedSender] }, optional: false, nullable: false
    end
  end
end
