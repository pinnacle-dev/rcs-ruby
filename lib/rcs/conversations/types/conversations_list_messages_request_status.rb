# frozen_string_literal: true

module Pinnacle
  module Conversations
    module Types
      class ConversationsListMessagesRequestStatus
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
