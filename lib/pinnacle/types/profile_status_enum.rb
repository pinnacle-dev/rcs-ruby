# frozen_string_literal: true

module Pinnacle
  module Types
    module ProfileStatusEnum
      extend Pinnacle::Internal::Types::Enum

      INCOMPLETE = "INCOMPLETE"
      IN_REVIEW = "IN REVIEW"
      VERIFIED = "VERIFIED"
      FAILED = "FAILED"
    end
  end
end
