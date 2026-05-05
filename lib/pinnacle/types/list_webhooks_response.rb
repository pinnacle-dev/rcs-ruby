# frozen_string_literal: true

module Pinnacle
  module Types
    class ListWebhooksResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Pinnacle::Types::WebhookSummary] }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMore"

      field :count, -> { Integer }, optional: false, nullable: false
    end
  end
end
