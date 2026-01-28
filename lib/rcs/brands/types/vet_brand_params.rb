# frozen_string_literal: true

module Rcs
  module Brands
    module Types
      class VetBrandParams < Internal::Types::Model
        field :brand_id, -> { String }, optional: false, nullable: false, api_name: "brandId"
        field :type, -> { String }, optional: false, nullable: false
        field :provider, -> { String }, optional: false, nullable: false
        field :vetting_class, -> { String }, optional: false, nullable: false, api_name: "vettingClass"
      end
    end
  end
end
