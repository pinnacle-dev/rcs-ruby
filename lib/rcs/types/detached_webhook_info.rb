# frozen_string_literal: true

module Rcs
  module Types
    class DetachedWebhookInfo < Internal::Types::Model
      field :message, -> { String }, optional: false, nullable: false
      field :webhook_id, -> { String }, optional: false, nullable: false, api_name: "webhookId"
      field :phone_number, -> { String }, optional: false, nullable: false, api_name: "phoneNumber"
    end
  end
end
