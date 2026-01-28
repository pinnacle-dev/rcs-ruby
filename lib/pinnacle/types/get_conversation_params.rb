# frozen_string_literal: true

module Pinnacle
  module Types
    # Parameters for getting a specific conversation.
    class GetConversationParams < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      member -> { Pinnacle::Types::ConversationByIdParams }
      member -> { Pinnacle::Types::ConversationByParticipantsParams }
    end
  end
end
