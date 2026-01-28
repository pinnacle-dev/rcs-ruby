# frozen_string_literal: true

module Rcs
  module Types
    # Pricing details for the phone number.
    class PhoneNumberCost < Internal::Types::Model
      field :monthly, -> { Integer }, optional: false, nullable: false
      field :upfront, -> { Integer }, optional: false, nullable: false
      field :currency, -> { String }, optional: false, nullable: false
    end
  end
end
