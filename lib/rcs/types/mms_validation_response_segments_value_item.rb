# frozen_string_literal: true

module Rcs
  module Types
    class MmsValidationResponseSegmentsValueItem < Internal::Types::Model
      field :files, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      field :size, -> { Integer }, optional: false, nullable: false
      field :text, -> { String }, optional: false, nullable: false
    end
  end
end
