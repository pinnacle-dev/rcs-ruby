# frozen_string_literal: true

module Pinnacle
  module Types
    # Classification of the phone number type based on Telesign’s taxonomy.
    #  Indicates the phone’s service category, such as mobile, fixed line, toll-free,
    #  or VOIP,
    #  along with special types like prepaid, pager, or restricted premium.
    #  The "INVALID" type denotes an unrecognized or improperly formatted number.
    class DetailedPhoneNumberEnum
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
