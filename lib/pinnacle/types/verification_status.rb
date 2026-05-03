# frozen_string_literal: true

module Pinnacle
  module Types
    module VerificationStatus
      extend Pinnacle::Internal::Types::Enum

      NOT_SENT = "NOT_SENT"
      SENT = "SENT"
      VERIFIED = "VERIFIED"
    end
  end
end
