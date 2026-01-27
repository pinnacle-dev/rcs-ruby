# frozen_string_literal: true

module Rcs
  module Types
    # Organization or company information.
    class VCardOrganization < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :units, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
