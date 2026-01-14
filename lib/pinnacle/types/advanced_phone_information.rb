# frozen_string_literal: true

module Pinnacle
  module Types
    # Detailed phone number analysis including validation status, classification with fraud risk,
    # precise geographic data, carrier intelligence, and enhanced contact information.
    # Provides comprehensive insights for risk assessment, compliance, and advanced usage scenarios.
    class AdvancedPhoneInformation < Internal::Types::Model
      field :is_valid, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isValid"
      field :type, -> { Pinnacle::Types::AdvancedPhoneInformationType }, optional: false, nullable: false
      field :formats, -> { Pinnacle::Types::NumberFormat }, optional: false, nullable: false
      field :location, -> { Pinnacle::Types::AdvancedPhoneInformationLocation }, optional: false, nullable: false
      field :carrier, -> { Pinnacle::Types::AdvancedPhoneInformationCarrier }, optional: false, nullable: false
      field :contact, -> { Pinnacle::Types::AdvancedPhoneInformationContact }, optional: false, nullable: true
    end
  end
end
