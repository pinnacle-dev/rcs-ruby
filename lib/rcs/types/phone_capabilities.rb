# frozen_string_literal: true

module Rcs
  module Types
    # Represents the communication capabilities available for a phone number.
    class PhoneCapabilities < Internal::Types::Model
      field :mms, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :sms, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :voice, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
