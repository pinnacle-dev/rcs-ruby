# frozen_string_literal: true

module Pinnacle
  module Types
    module CarrierLaunchStatus
      extend Pinnacle::Internal::Types::Enum

      NOT_LAUNCHED = "NOT_LAUNCHED"
      PENDING = "PENDING"
      LAUNCHED = "LAUNCHED"
    end
  end
end
