# frozen_string_literal: true

module Rcs
  module Types
    # Response for get brand status.
    class BrandStatus < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :status, -> { Rcs::Types::BrandStatusEnum }, optional: false, nullable: false
    end
  end
end
