# frozen_string_literal: true

module Pinnacle
  module Types
    class EnhancedContactItem < Internal::Types::Model
      field :description, -> { String }, optional: false, nullable: false
      field :email, -> { String }, optional: false, nullable: false
      field :links, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      field :linkedin, -> { String }, optional: false, nullable: true
      field :name, -> { String }, optional: false, nullable: false
    end
  end
end
