# frozen_string_literal: true

module Rcs
  module Types
    # The sender of messages in this conversation. Can be:
    # - A phone number with its capabilities and metadata
    # - An RCS agent with ID and name
    # - `null` if no sender is associated
    class ConversationSender < Internal::Types::Model
      extend Rcs::Internal::Types::Union

      member -> { Rcs::Types::Phone }
      member -> { Rcs::Types::Agent }
    end
  end
end
