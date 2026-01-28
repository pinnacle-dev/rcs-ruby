# frozen_string_literal: true

module Rcs
  module PhoneNumbers
    module Types
      # Filter your search by geographic location to find numbers in specific regions. <br>
      #
      # Toll-free numbers ignore city and state filters.
      class SearchPhoneNumberByLocation < Internal::Types::Model
        field :city, -> { String }, optional: true, nullable: false
        field :country_code, -> { String }, optional: true, nullable: false, api_name: "countryCode"
        field :national_destination_code, -> { String }, optional: true, nullable: false, api_name: "nationalDestinationCode"
        field :state, -> { String }, optional: true, nullable: false
      end
    end
  end
end
