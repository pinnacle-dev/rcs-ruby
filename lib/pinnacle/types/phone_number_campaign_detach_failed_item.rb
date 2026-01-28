# frozen_string_literal: true

module Pinnacle
  module Types
    class PhoneNumberCampaignDetachFailedItem < Internal::Types::Model
      field :number, -> { String }, optional: false, nullable: false
      field :error, -> { String }, optional: false, nullable: false
    end
  end
end
