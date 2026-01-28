# frozen_string_literal: true

module Pinnacle
  module Types
    # Information about an RCS agent sender in a conversation.
    class Agent < Internal::Types::Model
      field :agent_id, -> { String }, optional: false, nullable: false, api_name: "agentId"
      field :agent_name, -> { String }, optional: false, nullable: false, api_name: "agentName"
    end
  end
end
