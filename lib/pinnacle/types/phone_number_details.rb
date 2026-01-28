# frozen_string_literal: true

module Pinnacle
  module Types
    # Details of a phone number available for purchase.
    # Includes all essential data required for acquisition and operational planning.
    class PhoneNumberDetails < Internal::Types::Model
      field :number, -> { String }, optional: false, nullable: false
      field :phone_type, -> { Pinnacle::Types::PhoneEnum }, optional: false, nullable: false
      field :cost, -> { Pinnacle::Types::PhoneNumberCost }, optional: false, nullable: false
      field :features, -> { Internal::Types::Array[Pinnacle::Types::PhoneFeatureEnum] }, optional: false, nullable: false
      field :region, -> { Pinnacle::Types::PhoneNumberRegion }, optional: false, nullable: false
    end
  end
end
