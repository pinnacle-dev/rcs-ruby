# frozen_string_literal: true

module Rcs
  module Types
    class AudienceCountOnly < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :description, -> { String }, optional: false, nullable: false
      field :contact_count, -> { Integer }, optional: false, nullable: false, api_name: "contactCount"
    end
  end
end
