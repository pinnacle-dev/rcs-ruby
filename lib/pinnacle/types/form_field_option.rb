# frozen_string_literal: true

module Pinnacle
  module Types
    # A single choice inside a `select`, `radio`, or `checkbox` field.
    class FormFieldOption < Internal::Types::Model
      field :value, -> { String }, optional: false, nullable: false

      field :label, -> { String }, optional: false, nullable: false
    end
  end
end
