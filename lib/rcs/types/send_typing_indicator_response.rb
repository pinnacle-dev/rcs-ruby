# frozen_string_literal: true

module Rcs
  module Types
    # Response schema confirming the typing indicator was sent.
    class SendTypingIndicatorResponse < Internal::Types::Model
      field :success, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :agent_id, -> { String }, optional: false, nullable: false, api_name: "agentId"
      field :recipient, -> { String }, optional: false, nullable: false
      field :started_at, -> { String }, optional: false, nullable: false, api_name: "startedAt"
      field :ended_at, -> { String }, optional: false, nullable: false, api_name: "endedAt"
    end
  end
end
