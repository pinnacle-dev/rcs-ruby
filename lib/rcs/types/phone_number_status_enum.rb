# frozen_string_literal: true

module Rcs
  module Types
    module PhoneNumberStatusEnum
      extend Rcs::Internal::Types::Enum

      PENDING = "PENDING"
      ACTIVE = "ACTIVE"
      FAILURE = "FAILURE"
    end
  end
end
