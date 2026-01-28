# frozen_string_literal: true

module Rcs
  module Types
    class AttachedPhoneNumberResult < Internal::Types::Model
      field :phone_numbers, -> { Internal::Types::Array[Rcs::Types::PhoneNumberCampaignAttachPhoneNumbersItem] }, optional: false, nullable: false, api_name: "phoneNumbers"
      field :failed, -> { Internal::Types::Array[Rcs::Types::PhoneNumberCampaignAttachFailedItem] }, optional: false, nullable: false
    end
  end
end
