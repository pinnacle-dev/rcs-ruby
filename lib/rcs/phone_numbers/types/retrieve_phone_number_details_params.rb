# frozen_string_literal: true

module Rcs
  module PhoneNumbers
    module Types
      class RetrievePhoneNumberDetailsParams < Internal::Types::Model
        field :phone, -> { String }, optional: false, nullable: false
        field :level, -> { Rcs::PhoneNumbers::Types::PhoneDetailsSchemaLevel }, optional: false, nullable: false
        field :options, -> { Rcs::PhoneNumbers::Types::RetrievePhoneNumberDetailsOptions }, optional: true, nullable: false
      end
    end
  end
end
