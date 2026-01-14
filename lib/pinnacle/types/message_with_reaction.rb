# frozen_string_literal: true

module Pinnacle
  module Types
    # Message with additional conversation-specific fields including direction and reaction.
    class MessageWithReaction < Internal::Types::Model
      field :direction, -> { Pinnacle::Types::MessageWithReactionDirection }, optional: false, nullable: false
      field :reaction, -> { String }, optional: false, nullable: true
    end
  end
end
