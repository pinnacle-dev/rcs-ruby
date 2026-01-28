# frozen_string_literal: true

module Rcs
  module Conversations
    module Types
      module ConversationsListMessagesRequestStatus
        extend Rcs::Internal::Types::Enum

        PENDING = "PENDING"
        SENT = "SENT"
        SEND_FAILED = "SEND_FAILED"
        DELIVERED = "DELIVERED"
        DELIVERY_FAILED = "DELIVERY_FAILED"
        RECEIVED = "RECEIVED"
        READ = "READ"
      end
    end
  end
end
