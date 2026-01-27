# frozen_string_literal: true

module Rcs
  module Types
    class PhoneNumberCampaignDetachFailedItem < Internal::Types::Model
      field :number, -> { String }, optional: false, nullable: false
      field :error, -> { String }, optional: false, nullable: false
    end
  end
end
