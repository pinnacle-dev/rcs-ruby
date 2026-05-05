# frozen_string_literal: true

module Pinnacle
  module Contacts
    module Types
      class ListContactsParams < Internal::Types::Model
        field :page_index, -> { Integer }, optional: true, nullable: false, api_name: "pageIndex"

        field :page_size, -> { Integer }, optional: true, nullable: false, api_name: "pageSize"

        field :phone_number, -> { String }, optional: true, nullable: false, api_name: "phoneNumber"

        field :name, -> { String }, optional: true, nullable: false

        field :tags, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :is_archived, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isArchived"
      end
    end
  end
end
