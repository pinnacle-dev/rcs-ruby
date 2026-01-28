# frozen_string_literal: true

module Rcs
  module Types
    class DetachedPhoneNumberResult < Internal::Types::Model
      field :phone_numbers, -> { Internal::Types::Array[Rcs::Types::PhoneNumberCampaignDetachPhoneNumbersItem] }, optional: false, nullable: false, api_name: "phoneNumbers"
      field :failed, -> { Internal::Types::Array[Rcs::Types::PhoneNumberCampaignDetachFailedItem] }, optional: false, nullable: false
    end
  end
end
