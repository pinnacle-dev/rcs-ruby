# frozen_string_literal: true

module Rcs
  module Types
    # Geographic and political details where the phone number is registered.
    class BasicPhoneInformationLocation < Internal::Types::Model
      field :country, -> { Rcs::Types::BasicPhoneInformationLocationCountry }, optional: false, nullable: false
      field :place, -> { String }, optional: false, nullable: false
    end
  end
end
