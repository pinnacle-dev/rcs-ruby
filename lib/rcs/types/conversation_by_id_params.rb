# frozen_string_literal: true

module Rcs
  module Types
    # Retrieve conversation information by ID.
    class ConversationByIdParams < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
    end
  end
end
