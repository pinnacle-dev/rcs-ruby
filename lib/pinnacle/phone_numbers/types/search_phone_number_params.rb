# frozen_string_literal: true

module Pinnacle
  module PhoneNumbers
    module Types
      class SearchPhoneNumberParams < Internal::Types::Model
        field :features, -> { Internal::Types::Array[Pinnacle::Types::PhoneFeatureEnum] }, optional: true, nullable: false
        field :location, -> { Pinnacle::PhoneNumbers::Types::SearchPhoneNumberByLocation }, optional: true, nullable: false
        field :number, -> { Pinnacle::PhoneNumbers::Types::SearchPhoneNumberByDigits }, optional: true, nullable: false
        field :options, -> { Pinnacle::PhoneNumbers::Types::SearchPhoneNumberOptions }, optional: true, nullable: false
        field :type, -> { Internal::Types::Array[Pinnacle::Types::PhoneEnum] }, optional: false, nullable: false
      end
    end
  end
end
