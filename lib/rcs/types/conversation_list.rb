# frozen_string_literal: true

module Rcs
  module Types
    # Response for list conversation.
    class ConversationList < Internal::Types::Model
      field :count, -> { Integer }, optional: false, nullable: false
      field :conversations, -> { Internal::Types::Array[Rcs::Types::Conversation] }, optional: false, nullable: false
      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMore"
    end
  end
end
