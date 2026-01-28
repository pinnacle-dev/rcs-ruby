# frozen_string_literal: true

module Pinnacle
  module PhoneNumbers
    module Types
      class RetrievePhoneNumberDetailsParams < Internal::Types::Model
        field :phone, -> { String }, optional: false, nullable: false
        field :level, -> { Pinnacle::PhoneNumbers::Types::PhoneDetailsSchemaLevel }, optional: false, nullable: false
        field :options, -> { Pinnacle::PhoneNumbers::Types::RetrievePhoneNumberDetailsOptions }, optional: true, nullable: false
      end
    end
  end
end
