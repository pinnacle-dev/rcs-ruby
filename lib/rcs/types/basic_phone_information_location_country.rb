# frozen_string_literal: true

module Rcs
  module Types
    # Information about the country of registration.
    class BasicPhoneInformationLocationCountry < Internal::Types::Model
      field :code, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :prefix, -> { String }, optional: false, nullable: false
    end
  end
end
