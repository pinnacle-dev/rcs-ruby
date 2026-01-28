# frozen_string_literal: true

module Rcs
  module Types
    class Vcard < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :formatted_name, -> { String }, optional: true, nullable: false, api_name: "formattedName"
      field :name, -> { Rcs::Types::VCardName }, optional: true, nullable: false
      field :nickname, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :birthday, -> { String }, optional: true, nullable: false
      field :addresses, -> { Internal::Types::Array[Rcs::Types::VcardAddress] }, optional: true, nullable: false
      field :url, -> { String }, optional: true, nullable: false
      field :phones, -> { Internal::Types::Array[Rcs::Types::VcardPhone] }, optional: true, nullable: false
      field :emails, -> { Internal::Types::Array[Rcs::Types::VcardEmail] }, optional: true, nullable: false
      field :timezone, -> { String }, optional: true, nullable: false
      field :geo, -> { Rcs::Types::VCardGeo }, optional: true, nullable: false
      field :title, -> { String }, optional: true, nullable: false
      field :role, -> { String }, optional: true, nullable: false
      field :organization, -> { Rcs::Types::VCardOrganization }, optional: true, nullable: false
      field :categories, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :note, -> { String }, optional: true, nullable: false
    end
  end
end
