# frozen_string_literal: true

module Pinnacle
  module Contacts
    module Types
      class UpdateContactParams < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :description, -> { String }, optional: true, nullable: false
        field :email, -> { String }, optional: true, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :tags, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      end
    end
  end
end
