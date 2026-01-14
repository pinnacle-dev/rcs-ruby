# frozen_string_literal: true

module Pinnacle
  module PhoneNumbers
    module Types
      class PhoneNumbersGetResponse < Internal::Types::Model
        extend Pinnacle::Internal::Types::Union

        member -> { Pinnacle::Types::BasicPhoneInformation }
        member -> { Pinnacle::Types::AdvancedPhoneInformation }
      end
    end
  end
end
