# frozen_string_literal: true

module Pinnacle
  module PhoneNumbers
    module Types
      # Filter your search by digit pattern.
      class SearchPhoneNumberByDigits < Internal::Types::Model
        field :contains, -> { String }, optional: true, nullable: false
        field :ends_with, -> { String }, optional: true, nullable: false, api_name: "endsWith"
        field :starts_with, -> { String }, optional: true, nullable: false, api_name: "startsWith"
      end
    end
  end
end
