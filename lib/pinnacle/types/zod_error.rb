# frozen_string_literal: true

module Pinnacle
  module Types
    class ZodError < Internal::Types::Model
      field :description, -> { String }, optional: false, nullable: false
      field :errors, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end
