# frozen_string_literal: true

module Rcs
  module Types
    class OptionalContact < Internal::Types::Model
      field :description, -> { String }, optional: true, nullable: false
      field :email, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :tags, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
