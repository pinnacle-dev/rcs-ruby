# frozen_string_literal: true

module Pinnacle
  module Types
    # Message with additional conversation-specific fields including direction and reactions.
    class MessageWithReactions < Internal::Types::Model
      field :direction, -> { Pinnacle::Types::MessageWithReactionsDirection }, optional: false, nullable: false
      field :reactions, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
