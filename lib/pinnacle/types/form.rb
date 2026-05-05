# frozen_string_literal: true

module Pinnacle
  module Types
    # A hosted form definition.
    class Form < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :url, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: true

      field :description, -> { String }, optional: false, nullable: true

      field :fields, -> { Internal::Types::Array[Pinnacle::Types::FormField] }, optional: false, nullable: false

      field :can_update, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :expires_at, -> { String }, optional: false, nullable: true

      field :theme_override, -> { Pinnacle::Types::FormThemeOverride }, optional: false, nullable: true

      field :submission_count, -> { Integer }, optional: false, nullable: false

      field :last_submitted_at, -> { String }, optional: false, nullable: true

      field :archived_at, -> { String }, optional: false, nullable: true

      field :created_at, -> { String }, optional: false, nullable: false

      field :updated_at, -> { String }, optional: false, nullable: false
    end
  end
end
