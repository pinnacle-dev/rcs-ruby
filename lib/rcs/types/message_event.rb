# frozen_string_literal: true

module Rcs
  module Types
    # Represents an incoming message or message status update received via webhook.
    class MessageEvent < Internal::Types::Model
      field :type, -> { Rcs::Types::WebhookEventEnum }, optional: false, nullable: false
      field :conversation, -> { Rcs::Types::MessageEventConversation }, optional: false, nullable: false
      field :status, -> { Rcs::Types::MessageStatusEnum }, optional: false, nullable: false
      field :direction, -> { Rcs::Types::MessageEventDirection }, optional: false, nullable: false
      field :segments, -> { Integer }, optional: false, nullable: false
      field :sent_at, -> { String }, optional: false, nullable: false, api_name: "sentAt"
      field :delivered_at, -> { String }, optional: true, nullable: false, api_name: "deliveredAt"
      field :message, -> { Rcs::Types::MessageEventContent }, optional: false, nullable: false
    end
  end
end
