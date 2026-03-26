# frozen_string_literal: true

module Pinnacle
  module Campaigns
    module Rcs
      module Types
        module ListRcsCampaignsRequestStatus
          extend Pinnacle::Internal::Types::Enum

          INCOMPLETE = "INCOMPLETE"
          IN_REVIEW = "IN REVIEW"
          VERIFIED = "VERIFIED"
          FAILED = "FAILED"
        end
      end
    end
  end
end
