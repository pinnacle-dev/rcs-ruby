# frozen_string_literal: true

module Pinnacle
  module Types
    # Current status of the phone number.
    #  `PENDING`: Not active during the one or more of the following: purchase pending,
    #  brand or campaign pending verification, and pending assignment to a campaign.
    #  `ACTIVE`: Number is ready to send messages.
    #  `FAILURE`: Errors occurred while activating this number.
    class PhoneNumberStatusEnum
      PENDING = "PENDING"
      ACTIVE = "ACTIVE"
      FAILURE = "FAILURE"
    end
  end
end
