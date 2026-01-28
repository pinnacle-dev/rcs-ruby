# frozen_string_literal: true

module Pinnacle
  module Types
    class AudienceWithPagination < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :description, -> { String }, optional: false, nullable: false
      field :contacts, -> { Internal::Types::Array[Pinnacle::Types::Contact] }, optional: false, nullable: false
      field :contact_count, -> { Integer }, optional: false, nullable: false, api_name: "contactCount"
      field :pagination, -> { Pinnacle::Types::Pagination }, optional: false, nullable: false
    end
  end
end
