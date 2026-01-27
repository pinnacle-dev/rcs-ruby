# frozen_string_literal: true

module Rcs
  module PhoneNumbers
    module Types
      # Customize your lookup with additional options.
      class RetrievePhoneNumberDetailsOptions < Internal::Types::Model
        field :force, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :risk, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :enhanced_contact_info, -> { Rcs::PhoneNumbers::Types::EnhancedContactInfo }, optional: true, nullable: false
      end
    end
  end
end
