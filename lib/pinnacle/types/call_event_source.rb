# frozen_string_literal: true

module Pinnacle
  module Types
    module CallEventSource
      extend Pinnacle::Internal::Types::Enum

      WEBHOOK = "WEBHOOK"
      REST = "REST"
      WS_COMMAND = "WS_COMMAND"
    end
  end
end
