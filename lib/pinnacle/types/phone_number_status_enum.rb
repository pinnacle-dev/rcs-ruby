# frozen_string_literal: true

module Pinnacle
  module Types
    module PhoneNumberStatusEnum
      extend Pinnacle::Internal::Types::Enum

      PENDING = "PENDING"
      ACTIVE = "ACTIVE"
      FAILURE = "FAILURE"
    end
  end
end
