# frozen_string_literal: true

module Rcs
  module Types
    # Parameters for getting a specific conversation.
    class GetConversationParams < Internal::Types::Model
      extend Rcs::Internal::Types::Union

      member -> { Rcs::Types::ConversationByIdParams }
      member -> { Rcs::Types::ConversationByParticipantsParams }
    end
  end
end
