# frozen_string_literal: true

module Pinnacle
  class PhoneNumbers
    # Choose how much detail you want in your results:
    #  - `basic`: Receive essential info like carrier, location, and format.
    #  - `advanced`: Receive a deeper analysis including fraud risk, detailed location,
    #  and enhanced contact info.
    class PhoneDetailsSchemaLevel
      BASIC = "basic"
      ADVANCED = "advanced"
    end
  end
end
