# frozen_string_literal: true

module Pinnacle
  module Types
    # Current review status of the campaign. <br>
    #  `INCOMPLETE`: Not submitted. <br>
    #  `IN REVIEW`: Being reviewed by carriers. <br>
    #  `VERIFIED`: Approved and ready to send messages.<br>
    #  `FAILED`: Issues and errors related to the campaign's details.
    class ProfileStatusEnum
      INCOMPLETE = "INCOMPLETE"
      IN_REVIEW = "IN REVIEW"
      VERIFIED = "VERIFIED"
      FAILED = "FAILED"
    end
  end
end
