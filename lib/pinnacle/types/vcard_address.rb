# frozen_string_literal: true

module Pinnacle
  module Types
    class VcardAddress < Internal::Types::Model
      field :country_name, -> { String }, optional: true, nullable: false, api_name: "countryName"
      field :extended_address, -> { String }, optional: true, nullable: false, api_name: "extendedAddress"
      field :fulladdress, -> { String }, optional: true, nullable: false
      field :locality, -> { String }, optional: true, nullable: false
      field :postal_code, -> { String }, optional: true, nullable: false, api_name: "postalCode"
      field :post_office_box, -> { String }, optional: true, nullable: false, api_name: "postOfficeBox"
      field :region, -> { String }, optional: true, nullable: false
      field :street_address, -> { String }, optional: true, nullable: false, api_name: "streetAddress"
      field :type, -> { Internal::Types::Array[Pinnacle::Types::VCardAddressSchemaTypeItem] }, optional: true, nullable: false
    end
  end
end
