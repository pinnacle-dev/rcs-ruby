# frozen_string_literal: true

module Pinnacle
  module Types
    # Single-select radio group.
    class RadioField < Internal::Types::Model
      field :options, -> { Internal::Types::Array[Pinnacle::Types::FormFieldOption] }, optional: false, nullable: false
    end
  end
end
