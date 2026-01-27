# frozen_string_literal: true

module Rcs
  module Types
    module MessageWithReactionDirection
      extend Rcs::Internal::Types::Enum

      INBOUND = "INBOUND"
      OUTBOUND = "OUTBOUND"
    end
  end
end
