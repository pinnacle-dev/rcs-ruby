# frozen_string_literal: true

module Pinnacle
  module Types
    # Multi-line text input for longer free-form answers.
    class TextareaField < Internal::Types::Model
      field :placeholder, -> { String }, optional: true, nullable: false
      field :pattern, -> { String }, optional: true, nullable: false
      field :min_length, -> { Integer }, optional: true, nullable: false
      field :max_length, -> { Integer }, optional: true, nullable: false
    end
  end
end
