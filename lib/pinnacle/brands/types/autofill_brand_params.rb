# frozen_string_literal: true

module Pinnacle
  module Brands
    module Types
      class AutofillBrandParams < Internal::Types::Model
        field :additional_info, -> { String }, optional: true, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :options, -> { Pinnacle::Brands::Types::AutofillBrandOptions }, optional: true, nullable: false
        field :website, -> { String }, optional: true, nullable: false
      end
    end
  end
end
