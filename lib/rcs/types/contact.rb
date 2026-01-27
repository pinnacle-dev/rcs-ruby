# frozen_string_literal: true

module Rcs
  module Types
    class Contact < Internal::Types::Model
      field :description, -> { String }, optional: true, nullable: false
      field :email, -> { String }, optional: true, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :phone_number, -> { String }, optional: false, nullable: false, api_name: "phoneNumber"
      field :tags, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
