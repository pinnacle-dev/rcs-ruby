# frozen_string_literal: true

module Rcs
  module Types
    class UpdatedContactId < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
