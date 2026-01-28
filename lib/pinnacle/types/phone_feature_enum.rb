# frozen_string_literal: true

module Pinnacle
  module Types
    module PhoneFeatureEnum
      extend Pinnacle::Internal::Types::Enum

      SMS = "SMS"
      MMS = "MMS"
      VOICE = "VOICE"
      FAX = "FAX"
      EMERGENCY = "EMERGENCY"
      HD_VOICE = "HD_VOICE"
      INTERNATIONAL_SMS = "INTERNATIONAL_SMS"
      LOCAL_CALLING = "LOCAL_CALLING"
    end
  end
end
