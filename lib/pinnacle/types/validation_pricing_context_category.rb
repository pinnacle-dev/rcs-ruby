# frozen_string_literal: true

module Pinnacle
  module Types
    module ValidationPricingContextCategory
      extend Pinnacle::Internal::Types::Enum

      SMS_10_DLC = "SMS_10DLC"
      SMS_TOLL_FREE = "SMS_TOLL_FREE"
      SMS = "SMS"
      MMS = "MMS"
      RCS_TEXT = "RCS_TEXT"
      RCS_MEDIA = "RCS_MEDIA"
    end
  end
end
