# frozen_string_literal: true

module Pinnacle
  module Types
    # Response for get brand status.
    class BrandStatus < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :status, -> { Pinnacle::Types::BrandStatusEnum }, optional: false, nullable: false
    end
  end
end
