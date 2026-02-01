# frozen_string_literal: true

module Pinnacle
  module Conversations
    module Types
      module ConversationsListMessagesRequestStatus
        extend Pinnacle::Internal::Types::Enum

        PENDING = "PENDING"
        SENT = "SENT"
        SEND_FAILED = "SEND_FAILED"
        DELIVERED = "DELIVERED"
        DELIVERY_FAILED = "DELIVERY_FAILED"
        FALLBACK_SENT = "FALLBACK_SENT"
        RECEIVED = "RECEIVED"
        READ = "READ"
      end
    end
  end
end
