# frozen_string_literal: true

module Pinnacle
  module Types
    class ContactId < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
