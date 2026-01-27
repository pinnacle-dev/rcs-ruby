# frozen_string_literal: true

module Rcs
  module Types
    # Details of a phone number that has been successfully purchased and provisioned.
    # Includes all communication capabilities currently enabled for immediate use.
    class PurchasedNumber < Internal::Types::Model
      field :number, -> { String }, optional: false, nullable: false
      field :capabilities, -> { Rcs::Types::BuyResponseCapabilities }, optional: false, nullable: false
    end
  end
end
