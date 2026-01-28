# frozen_string_literal: true

module Rcs
  module Types
    # Key details about a phone number, including its validity, type, location, carrier, and contact information.
    # Provides the essential data required for verification, display, and basic analysis.
    class BasicPhoneInformation < Internal::Types::Model
      field :is_valid, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isValid"
      field :type, -> { Rcs::Types::PhoneNumberEnum }, optional: false, nullable: false
      field :formats, -> { Rcs::Types::NumberFormat }, optional: false, nullable: false
      field :location, -> { Rcs::Types::BasicPhoneInformationLocation }, optional: false, nullable: false
      field :carrier, -> { String }, optional: false, nullable: false
      field :contact, -> { Rcs::Types::BasicPhoneInformationContact }, optional: false, nullable: false
    end
  end
end
