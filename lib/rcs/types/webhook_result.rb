# frozen_string_literal: true

module Rcs
  module Types
    # Response containing all webhooks that match the requested identifiers.
    # Only includes the essential webhook information needed for identification and management.
    class WebhookResult < Internal::Types::Model
      field :webhooks, -> { Internal::Types::Array[Rcs::Types::Webhooks] }, optional: false, nullable: false
    end
  end
end
