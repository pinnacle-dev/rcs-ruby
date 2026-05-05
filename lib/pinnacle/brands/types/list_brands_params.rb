# frozen_string_literal: true

module Pinnacle
  module Brands
    module Types
      class ListBrandsParams < Internal::Types::Model
        field :page_index, -> { Integer }, optional: true, nullable: false, api_name: "pageIndex"

        field :page_size, -> { Integer }, optional: true, nullable: false, api_name: "pageSize"

        field :status, -> { Pinnacle::Brands::Types::ListBrandsRequestStatus }, optional: true, nullable: false

        field :is_archived, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isArchived"

        field :name, -> { String }, optional: true, nullable: false
      end
    end
  end
end
