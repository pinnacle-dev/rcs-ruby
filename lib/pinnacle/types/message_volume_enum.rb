# frozen_string_literal: true

module Pinnacle
  module Types
    module MessageVolumeEnum
      extend Pinnacle::Internal::Types::Enum

      TEN = "10"
      ONE_HUNDRED = "100"
      ONE_000 = "1,000"
      TEN_000 = "10,000"
      ONE_HUNDRED_000 = "100,000"
      TWO_HUNDRED_FIFTY_000 = "250,000"
      FIVE_HUNDRED_000 = "500,000"
      SEVEN_HUNDRED_FIFTY_000 = "750,000"
      ONE_000000 = "1,000,000"
      FIVE_000000 = "5,000,000"
      TEN_000000 = "10,000,000+"
    end
  end
end
