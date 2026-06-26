# frozen_string_literal: true

module Pinnacle
  module Types
    # User-provided subscriber details to compare with the carrier record. Provide at least one non-empty field.
    class SubscriberMatchAttributes < Internal::Types::Model
      field :id_document, -> { String }, optional: true, nullable: false, api_name: "idDocument"

      field :given_name, -> { String }, optional: true, nullable: false, api_name: "givenName"

      field :family_name, -> { String }, optional: true, nullable: false, api_name: "familyName"

      field :street_name, -> { String }, optional: true, nullable: false, api_name: "streetName"

      field :street_number, -> { String }, optional: true, nullable: false, api_name: "streetNumber"

      field :postal_code, -> { String }, optional: true, nullable: false, api_name: "postalCode"

      field :locality, -> { String }, optional: true, nullable: false

      field :region, -> { String }, optional: true, nullable: false

      field :country, -> { String }, optional: true, nullable: false

      field :street_number_suffix, -> { String }, optional: true, nullable: false, api_name: "streetNumberSuffix"

      field :birthdate, -> { String }, optional: true, nullable: false
    end
  end
end
