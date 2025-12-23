# frozen_string_literal: true

module Pinnacle
  module Types
    # Type of message the agent sends.<br>
    #  `OTP`: One time passwords or verification codes. <br>
    #  `TRANSACTIONAL`: Account updates, alerts, or notifications.<br>
    #  `PROMOTIONAL`: Marketing, sales, or offers.<br>
    #  `MULTI_USE`: Mixed message types.<br>
    class RcsMessagingTypeEnum
      OTP = "OTP"
      TRANSACTIONAL = "TRANSACTIONAL"
      PROMOTIONAL = "PROMOTIONAL"
      MULTI_USE = "MULTI_USE"
    end
  end
end
