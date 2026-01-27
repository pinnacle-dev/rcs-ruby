# frozen_string_literal: true

module Rcs
  module Types
    # Detailed information about the attached webhook.
    class AttachWebhookResponseWebhook < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :url, -> { String }, optional: false, nullable: false
      field :secret, -> { String }, optional: true, nullable: false
    end
  end
end
