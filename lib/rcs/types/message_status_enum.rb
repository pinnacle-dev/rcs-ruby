# frozen_string_literal: true

module Rcs
  module Types
    module MessageStatusEnum
      extend Rcs::Internal::Types::Enum

      QUEUED = "QUEUED"
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
