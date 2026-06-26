# frozen_string_literal: true

module Pinnacle
  module Types
    module CallEventSource
      extend Pinnacle::Internal::Types::Enum

      WEBHOOK = "WEBHOOK"
      REST = "REST"
      WS = "WS"
      SYSTEM = "SYSTEM"
    end
  end
end
