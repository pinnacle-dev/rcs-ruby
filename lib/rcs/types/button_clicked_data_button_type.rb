# frozen_string_literal: true

module Pinnacle
  module Types
    # Type of button clicked.
    #  - `CARD` for card buttons,
    #  - `QUICK_REPLY` for quick replies.
    #  - `null` if we cannot determine the button type. This is a rare edge case and is
    #  mainly here for backward compatibility.
    class ButtonClickedDataButtonType
      CARD = "CARD"
      QUICK_REPLY = "QUICK_REPLY"
    end
  end
end
