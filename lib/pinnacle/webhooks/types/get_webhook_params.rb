# frozen_string_literal: true

module Pinnacle
  module Webhooks
    module Types
      class GetWebhookParams < Internal::Types::Model
        field :identifiers, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      end
    end
  end
end
