# frozen_string_literal: true

module Rcs
  module Types
    module ProfileStatusEnum
      extend Rcs::Internal::Types::Enum

      INCOMPLETE = "INCOMPLETE"
      IN_REVIEW = "IN REVIEW"
      VERIFIED = "VERIFIED"
      FAILED = "FAILED"
    end
  end
end
