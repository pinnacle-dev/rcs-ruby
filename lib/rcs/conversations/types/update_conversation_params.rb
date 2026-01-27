# frozen_string_literal: true

module Rcs
  module Conversations
    module Types
      class UpdateConversationParams < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :notes, -> { String }, optional: false, nullable: false
      end
    end
  end
end
