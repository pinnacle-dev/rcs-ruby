# frozen_string_literal: true

module Pinnacle
  module Types
    # Current review status of the brand.
    #  `INCOMPLETE`: Has not been submitted.
    #  `PENDING`: Currently being reviewed.
    #  `VERIFIED`: Verified and good to go.
    #  `UNVERIFIED`: No longer verified due to an update in the brand details.
    #  `VETTED`: Brand has been vetted by an external provider and has received vetting
    #  scores.
    class BrandStatusEnum
      PENDING = "PENDING"
      UNVERIFIED = "UNVERIFIED"
      VERIFIED = "VERIFIED"
      VETTED = "VETTED"
      FAILED = "FAILED"
      INCOMPLETE = "INCOMPLETE"
    end
  end
end
