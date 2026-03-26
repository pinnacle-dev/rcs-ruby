# frozen_string_literal: true

module Pinnacle
  module Brands
    module Types
      module ListBrandsRequestStatus
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
end
