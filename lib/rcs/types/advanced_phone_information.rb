# frozen_string_literal: true

module Rcs
  module Types
    # Detailed phone number analysis including validation status, classification with fraud risk,
    # precise geographic data, carrier intelligence, and enhanced contact information.
    # Provides comprehensive insights for risk assessment, compliance, and advanced usage scenarios.
    class AdvancedPhoneInformation < Internal::Types::Model
      field :is_valid, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isValid"
      field :type, -> { Rcs::Types::AdvancedPhoneInformationType }, optional: false, nullable: false
      field :formats, -> { Rcs::Types::NumberFormat }, optional: false, nullable: false
      field :location, -> { Rcs::Types::AdvancedPhoneInformationLocation }, optional: false, nullable: false
      field :carrier, -> { Rcs::Types::AdvancedPhoneInformationCarrier }, optional: false, nullable: false
      field :contact, -> { Rcs::Types::AdvancedPhoneInformationContact }, optional: false, nullable: true
    end
  end
end
