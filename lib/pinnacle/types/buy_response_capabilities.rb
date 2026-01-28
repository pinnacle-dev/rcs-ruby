# frozen_string_literal: true

module Pinnacle
  module Types
    # Enabled communication features for the phone number.
    class BuyResponseCapabilities < Internal::Types::Model
      field :sms, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :mms, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :voice, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
