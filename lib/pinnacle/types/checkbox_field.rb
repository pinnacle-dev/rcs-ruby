# frozen_string_literal: true

module Pinnacle
  module Types
    # Multi-select checkbox group when `options` is provided. If `options` is omitted the field renders as a single
    # boolean checkbox.
    class CheckboxField < Internal::Types::Model
      field :options, -> { Internal::Types::Array[Pinnacle::Types::FormFieldOption] }, optional: true, nullable: false

      field :min_selected, -> { Integer }, optional: true, nullable: false

      field :max_selected, -> { Integer }, optional: true, nullable: false
    end
  end
end
