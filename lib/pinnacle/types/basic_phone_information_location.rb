# frozen_string_literal: true

module Pinnacle
  module Types
    # Geographic and political details where the phone number is registered.
    class BasicPhoneInformationLocation < Internal::Types::Model
      field :country, -> { Pinnacle::Types::BasicPhoneInformationLocationCountry }, optional: false, nullable: false
      field :place, -> { String }, optional: false, nullable: false
    end
  end
end
