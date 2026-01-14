# frozen_string_literal: true

module Pinnacle
  module Types
    # Represents an incoming message or message status update received via webhook.
    class MessageEvent < Internal::Types::Model
      field :type, -> { Pinnacle::Types::WebhookEventEnum }, optional: false, nullable: false
      field :conversation, -> { Pinnacle::Types::MessageEventConversation }, optional: false, nullable: false
      field :status, -> { Pinnacle::Types::MessageStatusEnum }, optional: false, nullable: false
      field :direction, -> { Pinnacle::Types::MessageEventDirection }, optional: false, nullable: false
      field :segments, -> { Integer }, optional: false, nullable: false
      field :sent_at, -> { String }, optional: false, nullable: false, api_name: "sentAt"
      field :delivered_at, -> { String }, optional: true, nullable: false, api_name: "deliveredAt"
      field :message, -> { Pinnacle::Types::MessageEventContent }, optional: false, nullable: false
    end
  end
end
