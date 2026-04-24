# frozen_string_literal: true

module Pinnacle
  module Forms
    module Types
      class UpdateFormParams < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :description, -> { String }, optional: true, nullable: false
        field :fields, -> { Internal::Types::Array[Pinnacle::Types::FormField] }, optional: true, nullable: false
        field :can_update, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :expires_at, -> { String }, optional: true, nullable: false
        field :theme_override, -> { Pinnacle::Types::FormThemeOverride }, optional: true, nullable: false
        field :archived_at, -> { String }, optional: true, nullable: false
      end
    end
  end
end
