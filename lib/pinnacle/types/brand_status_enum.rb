# frozen_string_literal: true

module Pinnacle
  module Types
    module BrandStatusEnum
      extend Pinnacle::Internal::Types::Enum

      PENDING = "PENDING"
      UNVERIFIED = "UNVERIFIED"
      VERIFIED = "VERIFIED"
      VETTED = "VETTED"
      FAILED = "FAILED"
      INCOMPLETE = "INCOMPLETE"
    end
  end
end
