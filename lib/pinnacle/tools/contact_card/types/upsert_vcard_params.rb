# frozen_string_literal: true

module Pinnacle
  module Tools
    module ContactCard
      module Types
        class UpsertVcardParams < Internal::Types::Model
          field :photo, -> { String }, optional: true, nullable: false
          field :id, -> { String }, optional: true, nullable: false
          field :formatted_name, -> { String }, optional: true, nullable: false, api_name: "formattedName"
          field :name, -> { Pinnacle::Types::VCardName }, optional: true, nullable: false
          field :nickname, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          field :birthday, -> { String }, optional: true, nullable: false
          field :addresses, -> { Internal::Types::Array[Pinnacle::Types::VcardAddress] }, optional: true, nullable: false
          field :url, -> { String }, optional: true, nullable: false
          field :phones, -> { Internal::Types::Array[Pinnacle::Types::VcardPhone] }, optional: true, nullable: false
          field :emails, -> { Internal::Types::Array[Pinnacle::Types::VcardEmail] }, optional: true, nullable: false
          field :timezone, -> { String }, optional: true, nullable: false
          field :geo, -> { Pinnacle::Types::VCardGeo }, optional: true, nullable: false
          field :title, -> { String }, optional: true, nullable: false
          field :role, -> { String }, optional: true, nullable: false
          field :organization, -> { Pinnacle::Types::VCardOrganization }, optional: true, nullable: false
          field :categories, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          field :note, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
