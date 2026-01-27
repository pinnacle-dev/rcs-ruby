# frozen_string_literal: true

module Rcs
  module Types
    # Create a new webhook and immediately attach it to your phone number.
    class CreateAndAttachWebhookByUrlParams < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :url, -> { String }, optional: false, nullable: false
      field :event, -> { Rcs::Types::WebhookEventEnum }, optional: false, nullable: true
    end
  end
end
