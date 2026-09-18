# frozen_string_literal: true

module Pinnacle
  module Types
    module FaxStatusEnum
      extend Pinnacle::Internal::Types::Enum

      PREPARING = "PREPARING"
      SUBMITTING = "SUBMITTING"
      SUBMISSION_UNKNOWN = "SUBMISSION_UNKNOWN"
      QUEUED = "QUEUED"
      PROCESSING = "PROCESSING"
      SENDING = "SENDING"
      RECEIVING = "RECEIVING"
      DELIVERED = "DELIVERED"
      RECEIVED = "RECEIVED"
      FAILED = "FAILED"
      CANCELLED = "CANCELLED"
    end
  end
end
