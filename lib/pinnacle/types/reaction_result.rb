# frozen_string_literal: true

module Pinnacle
  module Types
    class ReactionResult < Internal::Types::Model
      field :message_id, -> { String }, optional: false, nullable: false, api_name: "messageId"
      field :reaction_message_id, -> { String }, optional: false, nullable: false, api_name: "reactionMessageId"
    end
  end
end
