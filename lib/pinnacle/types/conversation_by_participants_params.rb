# frozen_string_literal: true

module Pinnacle
  module Types
    # Retrieve conversation information by sender and recipient.
    class ConversationByParticipantsParams < Internal::Types::Model
      field :recipient, -> { String }, optional: false, nullable: false
      field :sender, -> { String }, optional: false, nullable: false
    end
  end
end
