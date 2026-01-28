# frozen_string_literal: true

module Rcs
  module Types
    # Webhook configuration that defines where event notifications are sent.
    class Webhooks < Internal::Types::Model
      field :endpoint, -> { String }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
    end
  end
end
