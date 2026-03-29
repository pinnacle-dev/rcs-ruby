# frozen_string_literal: true

module Pinnacle
  module Types
    class AttachWebhookResponseWebhook < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :url, -> { String }, optional: false, nullable: false
      field :secret, -> { String }, optional: false, nullable: false
    end
  end
end
