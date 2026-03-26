# frozen_string_literal: true

module Pinnacle
  module Types
    module AgentUseCase
      extend Pinnacle::Internal::Types::Enum

      TRANSACTIONAL = "TRANSACTIONAL"
      PROMOTIONAL = "PROMOTIONAL"
      OTP = "OTP"
      MULTI_USE = "MULTI_USE"
    end
  end
end
