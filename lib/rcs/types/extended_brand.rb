# frozen_string_literal: true

module Rcs
  module Types
    class ExtendedBrand < Internal::Types::Model
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :id, -> { String }, optional: false, nullable: false
      field :is_archived, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isArchived"
      field :status, -> { Rcs::Types::BrandStatusEnum }, optional: false, nullable: false
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
