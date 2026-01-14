# frozen_string_literal: true

module Pinnacle
  module Types
    # Confirmation that a webhook has been successfully attached to the specified phone number.
    # Includes detailed webhook information, the subscribed event type, and the associated phone number.
    class ConfiguredWebhook < Internal::Types::Model
      field :webhook, -> { Pinnacle::Types::AttachWebhookResponseWebhook }, optional: false, nullable: false
      field :event, -> { Pinnacle::Types::WebhookEventEnum }, optional: false, nullable: false
      field :phone_number, -> { String }, optional: false, nullable: false, api_name: "phoneNumber"
    end
  end
end
