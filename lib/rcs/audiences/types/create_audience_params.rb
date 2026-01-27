# frozen_string_literal: true

module Rcs
  module Audiences
    module Types
      class CreateAudienceParams < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false
        field :description, -> { String }, optional: true, nullable: false
        field :contacts, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      end
    end
  end
end
