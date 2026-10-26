# frozen_string_literal: true

module Pinnacle
  module Types
    module NetworkRequestType
      extend Pinnacle::Internal::Types::Enum

      SILENT_AUTH = "silent-auth"
      SIM_SWAP = "sim-swap"
      SUBSCRIBER_MATCH = "subscriber-match"
    end
  end
end
