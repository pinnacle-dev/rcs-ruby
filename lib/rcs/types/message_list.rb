# frozen_string_literal: true

module Rcs
  module Types
    # Paginated list of messages in a conversation.
    class MessageList < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Rcs::Types::MessageWithReaction] }, optional: false, nullable: false
      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMore"
      field :count, -> { Integer }, optional: false, nullable: false
    end
  end
end
