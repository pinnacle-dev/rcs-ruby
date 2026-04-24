# frozen_string_literal: true

module Pinnacle
  module Types
    # Snapshot of a single form field paired with the value the recipient submitted.
    class FormSubmittedField < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false
      field :label, -> { String }, optional: false, nullable: false
      field :type, -> { String }, optional: false, nullable: false
      field :value, -> { Pinnacle::Types::FormSubmissionAnswer }, optional: false, nullable: true
    end
  end
end
