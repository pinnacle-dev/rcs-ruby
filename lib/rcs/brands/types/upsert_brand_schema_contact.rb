# frozen_string_literal: true

module Rcs
  module Brands
    module Types
      # Contact information for the brand.
      class UpsertBrandSchemaContact < Internal::Types::Model
        field :email, -> { String }, optional: true, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :phone, -> { String }, optional: true, nullable: false
        field :title, -> { String }, optional: true, nullable: false
      end
    end
  end
end
