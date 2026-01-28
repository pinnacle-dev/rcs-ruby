# frozen_string_literal: true

module Rcs
  module Brands
    module Types
      class BrandsGetRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :hide_ein, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hideEIN"
      end
    end
  end
end
