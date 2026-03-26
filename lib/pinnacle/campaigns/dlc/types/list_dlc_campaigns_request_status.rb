# frozen_string_literal: true

module Pinnacle
  module Campaigns
    module Dlc
      module Types
        module ListDlcCampaignsRequestStatus
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
