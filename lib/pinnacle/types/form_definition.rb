# frozen_string_literal: true

module Pinnacle
  module Types
    # The minimum shape needed to create a form. Used by `POST /forms` and inline by `POST /forms/send`.
    class FormDefinition < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :fields, -> { Internal::Types::Array[Pinnacle::Types::FormField] }, optional: false, nullable: false
      field :can_update, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :expires_at, -> { String }, optional: true, nullable: false
      field :theme_override, -> { Pinnacle::Types::FormThemeOverride }, optional: true, nullable: false
    end
  end
end
