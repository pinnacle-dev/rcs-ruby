# frozen_string_literal: true

module Rcs
  module Brands
    module Types
      class AutofillBrandParams < Internal::Types::Model
        field :additional_info, -> { String }, optional: true, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :options, -> { Rcs::Brands::Types::AutofillBrandOptions }, optional: true, nullable: false
        field :website, -> { String }, optional: true, nullable: false
      end
    end
  end
end
