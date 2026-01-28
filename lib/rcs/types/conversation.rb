# frozen_string_literal: true

module Rcs
  module Types
    # Conversation that was found.
    class Conversation < Internal::Types::Model
      field :brand_id, -> { String }, optional: false, nullable: true, api_name: "brandId"
      field :campaign, -> { Rcs::Types::CampaignQuery }, optional: false, nullable: true
      field :contact, -> { Rcs::Types::ConversationContact }, optional: false, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :id, -> { String }, optional: false, nullable: false
      field :notes, -> { String }, optional: false, nullable: false
      field :sender, -> { Rcs::Types::ConversationSender }, optional: false, nullable: true
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
