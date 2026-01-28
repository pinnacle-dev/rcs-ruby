# frozen_string_literal: true

module Pinnacle
  module Types
    # Enhanced contact information associated with the phone number.
    class AdvancedPhoneInformationContact < Internal::Types::Model
      field :first_name, -> { String }, optional: true, nullable: false, api_name: "firstName"
      field :last_name, -> { String }, optional: true, nullable: false, api_name: "lastName"
      field :email_address, -> { String }, optional: true, nullable: false, api_name: "emailAddress"
      field :street, -> { String }, optional: true, nullable: false
      field :unit, -> { String }, optional: true, nullable: false
      field :place, -> { String }, optional: true, nullable: false
      field :zip, -> { String }, optional: true, nullable: false
      field :state, -> { String }, optional: true, nullable: false
      field :country, -> { String }, optional: true, nullable: false
      field :profiles, -> { Internal::Types::Array[Pinnacle::Types::EnhancedContactItem] }, optional: true, nullable: false
    end
  end
end
