# frozen_string_literal: true

module Pinnacle
  module Audiences
    module Contacts
      module Types
        class AddContactsParams < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :contacts, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        end
      end
    end
  end
end
