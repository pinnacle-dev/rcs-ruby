# frozen_string_literal: true

module Pinnacle
  module Types
    # Single-select dropdown.
    class SelectField < Internal::Types::Model
      field :options, -> { Internal::Types::Array[Pinnacle::Types::FormFieldOption] }, optional: false, nullable: false

      field :placeholder, -> { String }, optional: true, nullable: false
    end
  end
end
