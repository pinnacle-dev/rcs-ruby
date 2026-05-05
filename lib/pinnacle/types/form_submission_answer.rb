# frozen_string_literal: true

module Pinnacle
  module Types
    # The value submitted for a single form field. Shape depends on the field type:
    # - `text`, `email`, `phone`, `url`, `textarea`, `select`, `radio` → string
    # - `number` → number
    # - `checkbox` (single) → boolean
    # - `checkbox` (multi), `multiselect` → array of strings
    # - Skipped optional field → null
    class FormSubmissionAnswer < Internal::Types::Model
      extend Pinnacle::Internal::Types::Union

      member -> { String }

      member -> { Integer }

      member -> { Internal::Types::Boolean }

      member -> { Internal::Types::Array[String] }
    end
  end
end
