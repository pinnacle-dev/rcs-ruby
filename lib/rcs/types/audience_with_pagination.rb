# frozen_string_literal: true

module Rcs
  module Types
    class AudienceWithPagination < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :description, -> { String }, optional: false, nullable: false
      field :contacts, -> { Internal::Types::Array[Rcs::Types::Contact] }, optional: false, nullable: false
      field :contact_count, -> { Integer }, optional: false, nullable: false, api_name: "contactCount"
      field :pagination, -> { Rcs::Types::Pagination }, optional: false, nullable: false
    end
  end
end
