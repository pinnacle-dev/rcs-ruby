# frozen_string_literal: true

module Pinnacle
  module Types
    class PhoneNumberCampaignAttachPhoneNumbersItem < Internal::Types::Model
      field :phone_number, -> { String }, optional: false, nullable: false, api_name: "phoneNumber"
      field :campaign, -> { Pinnacle::Types::PhoneNumberCampaignAttachPhoneNumbersItemCampaign }, optional: false, nullable: false
    end
  end
end
