# frozen_string_literal: true

module Pinnacle
  module Types
    # Classification of phone number types based on their billing and geographic
    #  properties. <br>
    #  Determines pricing structure and availability patterns.
    class PhoneEnum
      LOCAL = "LOCAL"
      TOLL_FREE = "TOLL_FREE"
    end
  end
end
