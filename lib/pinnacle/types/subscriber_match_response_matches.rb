# frozen_string_literal: true

module Pinnacle
  module Types
    # Match strength for each evaluated subscriber attribute.
    #
    # - `exact`: Carrier record matches the submitted value exactly.
    # - `high`: Strong match with minor formatting or normalization differences.
    # - `partial`: Some parts match, but the value is not a strong match.
    # - `low`: Weak match.
    # - `none`: Carrier record does not match the submitted value.
    # - `unavailable`: Carrier could not evaluate this attribute.
    # - `included-with-address-match`: Attribute was evaluated as part of the overall address match.
    # - `unknown`: Carrier returned a match value Pinnacle does not recognize yet.
    class SubscriberMatchResponseMatches < Internal::Types::Model
      field :id_document, -> { Pinnacle::Types::SubscriberMatchResult }, optional: true, nullable: false, api_name: "idDocument"

      field :given_name, -> { Pinnacle::Types::SubscriberMatchResult }, optional: true, nullable: false, api_name: "givenName"

      field :family_name, -> { Pinnacle::Types::SubscriberMatchResult }, optional: true, nullable: false, api_name: "familyName"

      field :address, -> { Pinnacle::Types::SubscriberMatchResult }, optional: true, nullable: false

      field :street_name, -> { Pinnacle::Types::SubscriberMatchResult }, optional: true, nullable: false, api_name: "streetName"

      field :street_number, -> { Pinnacle::Types::SubscriberMatchResult }, optional: true, nullable: false, api_name: "streetNumber"

      field :postal_code, -> { Pinnacle::Types::SubscriberMatchResult }, optional: true, nullable: false, api_name: "postalCode"

      field :locality, -> { Pinnacle::Types::SubscriberMatchResult }, optional: true, nullable: false

      field :region, -> { Pinnacle::Types::SubscriberMatchResult }, optional: true, nullable: false

      field :country, -> { Pinnacle::Types::SubscriberMatchResult }, optional: true, nullable: false

      field :street_number_suffix, -> { Pinnacle::Types::SubscriberMatchResult }, optional: true, nullable: false, api_name: "streetNumberSuffix"

      field :birthdate, -> { Pinnacle::Types::SubscriberMatchResult }, optional: true, nullable: false
    end
  end
end
