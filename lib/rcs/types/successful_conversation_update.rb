# frozen_string_literal: true

module Rcs
  module Types
    # Successfully updated conversation.
    class SuccessfulConversationUpdate < Internal::Types::Model
      field :success, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
