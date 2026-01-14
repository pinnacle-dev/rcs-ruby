# frozen_string_literal: true

module Pinnacle
  module Types
    class AttachedPhoneNumberResult < Internal::Types::Model
      field :phone_numbers, -> { Internal::Types::Array[Pinnacle::Types::PhoneNumberCampaignAttachPhoneNumbersItem] }, optional: false, nullable: false, api_name: "phoneNumbers"
      field :failed, -> { Internal::Types::Array[Pinnacle::Types::PhoneNumberCampaignAttachFailedItem] }, optional: false, nullable: false
    end
  end
end
