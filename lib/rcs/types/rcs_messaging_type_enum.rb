# frozen_string_literal: true

module Rcs
  module Types
    module RcsMessagingTypeEnum
      extend Rcs::Internal::Types::Enum

      OTP = "OTP"
      TRANSACTIONAL = "TRANSACTIONAL"
      PROMOTIONAL = "PROMOTIONAL"
      MULTI_USE = "MULTI_USE"
    end
  end
end
