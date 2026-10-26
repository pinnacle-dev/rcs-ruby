# frozen_string_literal: true

module Pinnacle
  module Types
    module SilentAuthCheckResponseStatus
      extend Pinnacle::Internal::Types::Enum

      COMPLETED = "completed"
      FAILED = "failed"
    end
  end
end
