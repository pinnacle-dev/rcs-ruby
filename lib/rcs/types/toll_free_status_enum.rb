# frozen_string_literal: true

module Rcs
  module Types
    module TollFreeStatusEnum
      extend Rcs::Internal::Types::Enum

      WAITING_FOR_PROVIDER = "WAITING_FOR_PROVIDER"
      WAITING_FOR_CUSTOMER = "WAITING_FOR_CUSTOMER"
      WAITING_FOR_TELECO = "WAITING_FOR_TELECO"
      IN_PROGRESS = "IN_PROGRESS"
      VERIFIED = "VERIFIED"
      REJECTED = "REJECTED"
    end
  end
end
