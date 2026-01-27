# frozen_string_literal: true

module Rcs
  module PhoneNumbers
    module Types
      class PhoneNumbersGetResponse < Internal::Types::Model
        extend Rcs::Internal::Types::Union

        member -> { Rcs::Types::BasicPhoneInformation }
        member -> { Rcs::Types::AdvancedPhoneInformation }
      end
    end
  end
end
