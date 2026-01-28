# frozen_string_literal: true

module Pinnacle
  module Types
    module TollFreeStatusEnum
      extend Pinnacle::Internal::Types::Enum

      WAITING_FOR_PROVIDER = "WAITING_FOR_PROVIDER"
      WAITING_FOR_CUSTOMER = "WAITING_FOR_CUSTOMER"
      WAITING_FOR_TELECO = "WAITING_FOR_TELECO"
      IN_PROGRESS = "IN_PROGRESS"
      VERIFIED = "VERIFIED"
      REJECTED = "REJECTED"
    end
  end
end
