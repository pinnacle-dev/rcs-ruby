# frozen_string_literal: true

module Rcs
  module Types
    class SentSmsDetails < Internal::Types::Model
      field :message_id, -> { String }, optional: false, nullable: false, api_name: "messageId"
      field :segments, -> { Rcs::Types::SendSmsResponseSegments }, optional: false, nullable: false
      field :total_cost, -> { Integer }, optional: false, nullable: false, api_name: "totalCost"
      field :sender, -> { String }, optional: false, nullable: false
      field :recipient, -> { String }, optional: false, nullable: false
      field :status, -> { String }, optional: false, nullable: false
    end
  end
end
