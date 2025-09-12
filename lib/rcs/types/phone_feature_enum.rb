# frozen_string_literal: true

module Pinnacle
  module Types
    # Communication features and capabilities supported by a phone number. <br>
    #  These features determine what types of communication the number can handle.
    class PhoneFeatureEnum
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
