# frozen_string_literal: true

module Pinnacle
  module Types
    # Represents an event triggered by a user such as when they start typing.
    class UserEvent < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false
      field :started_at, -> { String }, optional: false, nullable: false, api_name: "startedAt"
      field :conversation, -> { Pinnacle::Types::UserEventConversation }, optional: false, nullable: false
    end
  end
end
