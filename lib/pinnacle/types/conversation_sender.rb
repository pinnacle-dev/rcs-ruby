# frozen_string_literal: true

module Pinnacle
  module Types
    # The sender of messages in this conversation. Can be:
    # - A phone number with its capabilities and metadata
    # - An RCS agent with ID and name
    # - `null` if no sender is associated
    class ConversationSender < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      member -> { Pinnacle::Types::Phone }
      member -> { Pinnacle::Types::Agent }
    end
  end
end
