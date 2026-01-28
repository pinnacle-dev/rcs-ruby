# frozen_string_literal: true

module Rcs
  module Types
    module DetailedPhoneNumberEnum
      extend Rcs::Internal::Types::Enum

      FIXED_LINE = "FIXED_LINE"
      INVALID = "INVALID"
      MOBILE = "MOBILE"
      OTHER = "OTHER"
      PAGER = "PAGER"
      PAYPHONE = "PAYPHONE"
      PERSONAL = "PERSONAL"
      PREPAID = "PREPAID"
      RESTRICTED_PREMIUM = "RESTRICTED_PREMIUM"
      TOLL_FREE = "TOLL_FREE"
      VOICEMAIL = "VOICEMAIL"
      VOIP = "VOIP"
    end
  end
end
