# frozen_string_literal: true

module Pinnacle
  module Types
    module RecordingState
      extend Pinnacle::Internal::Types::Enum

      PENDING = "PENDING"
      READY = "READY"
      FAILED = "FAILED"
      DELETED = "DELETED"
    end
  end
end
