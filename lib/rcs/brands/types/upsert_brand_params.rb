# frozen_string_literal: true

module Rcs
  module Brands
    module Types
      class UpsertBrandParams < Internal::Types::Model
        field :address, -> { String }, optional: true, nullable: false
        field :contact, -> { Rcs::Brands::Types::UpsertBrandSchemaContact }, optional: true, nullable: false
        field :dba, -> { String }, optional: true, nullable: false
        field :description, -> { String }, optional: true, nullable: false
        field :ein, -> { String }, optional: true, nullable: false
        field :email, -> { String }, optional: true, nullable: false
        field :id, -> { String }, optional: true, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :sector, -> { Rcs::Brands::Types::UpsertBrandSchemaSector }, optional: true, nullable: false
        field :type, -> { Rcs::Brands::Types::UpsertBrandSchemaType }, optional: true, nullable: false
        field :entity_type, -> { Rcs::Brands::Types::UpsertBrandSchemaEntityType }, optional: true, nullable: false, api_name: "entityType"
        field :website, -> { String }, optional: true, nullable: false
      end
    end
  end
end
