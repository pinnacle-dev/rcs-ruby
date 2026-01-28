# frozen_string_literal: true

module Pinnacle
  module Brands
    module Types
      class UpsertBrandParams < Internal::Types::Model
        field :address, -> { String }, optional: true, nullable: false
        field :contact, -> { Pinnacle::Brands::Types::UpsertBrandSchemaContact }, optional: true, nullable: false
        field :dba, -> { String }, optional: true, nullable: false
        field :description, -> { String }, optional: true, nullable: false
        field :ein, -> { String }, optional: true, nullable: false
        field :email, -> { String }, optional: true, nullable: false
        field :id, -> { String }, optional: true, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :sector, -> { Pinnacle::Brands::Types::UpsertBrandSchemaSector }, optional: true, nullable: false
        field :type, -> { Pinnacle::Brands::Types::UpsertBrandSchemaType }, optional: true, nullable: false
        field :entity_type, -> { Pinnacle::Brands::Types::UpsertBrandSchemaEntityType }, optional: true, nullable: false, api_name: "entityType"
        field :website, -> { String }, optional: true, nullable: false
      end
    end
  end
end
