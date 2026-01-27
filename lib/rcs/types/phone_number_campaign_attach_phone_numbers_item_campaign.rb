# frozen_string_literal: true

module Rcs
  module Types
    # Campaign that the phone is now attached to.
    class PhoneNumberCampaignAttachPhoneNumbersItemCampaign < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :type, -> { Rcs::Types::MessagingProfileEnum }, optional: false, nullable: false
    end
  end
end
