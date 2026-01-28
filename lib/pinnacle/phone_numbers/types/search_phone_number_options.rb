# frozen_string_literal: true

module Pinnacle
  module PhoneNumbers
    module Types
      # Extra search settings to control how many results you get.
      class SearchPhoneNumberOptions < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
