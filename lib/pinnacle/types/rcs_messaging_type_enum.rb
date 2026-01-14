# frozen_string_literal: true

module Pinnacle
  module Types
    module RcsMessagingTypeEnum
      extend Pinnacle::Internal::Types::Enum

      OTP = "OTP"
      TRANSACTIONAL = "TRANSACTIONAL"
      PROMOTIONAL = "PROMOTIONAL"
      MULTI_USE = "MULTI_USE"
    end
  end
end
