# frozen_string_literal: true

module Pinnacle
  module Types
    # Properties shared by every field variant. Not intended to be referenced directly — use a specific field type from
    # `FormField`.
    class FieldBase < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false
      field :label, -> { String }, optional: false, nullable: false
      field :required, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :help_text, -> { String }, optional: true, nullable: false
    end
  end
end
