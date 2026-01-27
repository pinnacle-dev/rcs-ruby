# frozen_string_literal: true

module Rcs
  module Contacts
    module Types
      class ContactsGetRequest < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false
        field :phone_number, -> { String }, optional: true, nullable: false, api_name: "phoneNumber"
      end
    end
  end
end
