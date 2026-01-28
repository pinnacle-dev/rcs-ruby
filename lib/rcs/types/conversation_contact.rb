# frozen_string_literal: true

module Rcs
  module Types
    # Contact information for the recipient in a conversation.
    class ConversationContact < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :phone_number, -> { String }, optional: false, nullable: false, api_name: "phoneNumber"
    end
  end
end
