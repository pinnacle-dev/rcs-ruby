# frozen_string_literal: true

module Pinnacle
  module PhoneNumbers
    module Types
      class BuyPhoneNumberParams < Internal::Types::Model
        field :numbers, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      end
    end
  end
end
