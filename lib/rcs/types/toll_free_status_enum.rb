# frozen_string_literal: true

module Pinnacle
  module Types
    # Current assignment status of the toll free number to this campaign.
    #  `IN_PROGRESS`: Being reviewed.
    #  `WAITING_FOR_PROVIDER`: Being reviewed by our toll-free vendor.
    #  `WAITING_FOR_TELECO`: Final review by carriers before number is live.
    #  `VERIFIED`: Verified and ready to send messages.
    #  `REJECTED`: Issues were found related to your campaign.
    class TollFreeStatusEnum
      WAITING_FOR_PROVIDER = "WAITING_FOR_PROVIDER"
      WAITING_FOR_CUSTOMER = "WAITING_FOR_CUSTOMER"
      WAITING_FOR_TELECO = "WAITING_FOR_TELECO"
      IN_PROGRESS = "IN_PROGRESS"
      VERIFIED = "VERIFIED"
      REJECTED = "REJECTED"
    end
  end
end
