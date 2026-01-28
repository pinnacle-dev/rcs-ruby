# frozen_string_literal: true

module Pinnacle
  module Types
    # Details of a phone number that has been successfully purchased and provisioned.
    # Includes all communication capabilities currently enabled for immediate use.
    class PurchasedNumber < Internal::Types::Model
      field :number, -> { String }, optional: false, nullable: false
      field :capabilities, -> { Pinnacle::Types::BuyResponseCapabilities }, optional: false, nullable: false
    end
  end
end
