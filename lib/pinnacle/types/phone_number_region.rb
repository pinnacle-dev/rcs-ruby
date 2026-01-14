# frozen_string_literal: true

module Pinnacle
  module Types
    # Geographic and routing information for the phone number.
    class PhoneNumberRegion < Internal::Types::Model
      field :country, -> { String }, optional: false, nullable: false
      field :state, -> { String }, optional: true, nullable: false
      field :city, -> { String }, optional: true, nullable: false
      field :rate_center, -> { String }, optional: true, nullable: false, api_name: "rateCenter"
    end
  end
end
