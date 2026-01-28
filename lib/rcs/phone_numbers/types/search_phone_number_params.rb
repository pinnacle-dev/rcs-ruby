# frozen_string_literal: true

module Rcs
  module PhoneNumbers
    module Types
      class SearchPhoneNumberParams < Internal::Types::Model
        field :features, -> { Internal::Types::Array[Rcs::Types::PhoneFeatureEnum] }, optional: true, nullable: false
        field :location, -> { Rcs::PhoneNumbers::Types::SearchPhoneNumberByLocation }, optional: true, nullable: false
        field :number, -> { Rcs::PhoneNumbers::Types::SearchPhoneNumberByDigits }, optional: true, nullable: false
        field :options, -> { Rcs::PhoneNumbers::Types::SearchPhoneNumberOptions }, optional: true, nullable: false
        field :type, -> { Internal::Types::Array[Rcs::Types::PhoneEnum] }, optional: false, nullable: false
      end
    end
  end
end
