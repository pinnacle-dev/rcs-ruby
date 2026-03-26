# frozen_string_literal: true

module Pinnacle
  module Types
    module RcsWhitelistStatus
      extend Pinnacle::Internal::Types::Enum

      PENDING = "PENDING"
      ACCEPTED = "ACCEPTED"
      REJECTED = "REJECTED"
    end
  end
end
