# frozen_string_literal: true

module Pinnacle
  module Types
    class DetachWebhookResult < Internal::Types::Model
      field :webhook_id, -> { String }, optional: false, nullable: false, api_name: "webhookId"
      field :senders, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      field :failed, -> { Internal::Types::Array[Pinnacle::Types::FailedSender] }, optional: false, nullable: false
    end
  end
end
