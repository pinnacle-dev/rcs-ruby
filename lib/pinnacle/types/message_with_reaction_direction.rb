# frozen_string_literal: true

module Pinnacle
  module Types
    module MessageWithReactionDirection
      extend Pinnacle::Internal::Types::Enum

      INBOUND = "INBOUND"
      OUTBOUND = "OUTBOUND"
    end
  end
end
