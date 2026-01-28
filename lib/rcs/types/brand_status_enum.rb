# frozen_string_literal: true

module Rcs
  module Types
    module BrandStatusEnum
      extend Rcs::Internal::Types::Enum

      PENDING = "PENDING"
      UNVERIFIED = "UNVERIFIED"
      VERIFIED = "VERIFIED"
      VETTED = "VETTED"
      FAILED = "FAILED"
      INCOMPLETE = "INCOMPLETE"
    end
  end
end
