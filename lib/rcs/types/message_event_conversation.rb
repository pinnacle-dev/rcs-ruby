# frozen_string_literal: true

module Rcs
  module Types
    # Conversation metadata containing the conversation ID, sender, and recipient information.
    class MessageEventConversation < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :from, -> { String }, optional: false, nullable: false
      field :to, -> { String }, optional: false, nullable: false
    end
  end
end
