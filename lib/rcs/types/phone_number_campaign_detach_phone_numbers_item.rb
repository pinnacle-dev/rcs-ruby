# frozen_string_literal: true

module Rcs
  module Types
    class PhoneNumberCampaignDetachPhoneNumbersItem < Internal::Types::Model
      field :phone_number, -> { String }, optional: false, nullable: false, api_name: "phoneNumber"
      field :campaign, -> { Rcs::Types::PhoneNumberCampaignDetachPhoneNumbersItemCampaign }, optional: false, nullable: false
    end
  end
end
