# frozen_string_literal: true

module Rcs
  module Types
    # Structured name components.
    class VCardName < Internal::Types::Model
      field :family_name, -> { String }, optional: true, nullable: false, api_name: "familyName"
      field :given_name, -> { String }, optional: true, nullable: false, api_name: "givenName"
      field :additional_names, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "additionalNames"
      field :honorific_prefixes, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "honorificPrefixes"
      field :honorific_suffixes, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "honorificSuffixes"
    end
  end
end
