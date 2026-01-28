# frozen_string_literal: true

module Pinnacle
  module Types
    class DetachedPhoneNumberResult < Internal::Types::Model
      field :phone_numbers, -> { Internal::Types::Array[Pinnacle::Types::PhoneNumberCampaignDetachPhoneNumbersItem] }, optional: false, nullable: false, api_name: "phoneNumbers"
      field :failed, -> { Internal::Types::Array[Pinnacle::Types::PhoneNumberCampaignDetachFailedItem] }, optional: false, nullable: false
    end
  end
end
