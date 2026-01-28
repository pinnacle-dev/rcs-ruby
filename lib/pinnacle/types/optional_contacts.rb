# frozen_string_literal: true

module Pinnacle
  module Types
    # Contact information for the primary brand representative.
    class OptionalContacts < Internal::Types::Model
      field :email, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :phone, -> { String }, optional: true, nullable: false
      field :title, -> { String }, optional: true, nullable: false
    end
  end
end
