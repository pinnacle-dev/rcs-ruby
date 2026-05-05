# frozen_string_literal: true

module Pinnacle
  module Types
    class WebhookSummary < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :endpoint, -> { String }, optional: false, nullable: false

      field :status, -> { Pinnacle::Types::WebhookSummaryStatus }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"

      field :headers, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
    end
  end
end
