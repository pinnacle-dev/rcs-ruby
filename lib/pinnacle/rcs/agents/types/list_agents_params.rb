# frozen_string_literal: true

module Pinnacle
  module Rcs
    module Agents
      module Types
        class ListAgentsParams < Internal::Types::Model
          field :page_index, -> { Integer }, optional: true, nullable: false, api_name: "pageIndex"
          field :page_size, -> { Integer }, optional: true, nullable: false, api_name: "pageSize"
          field :agent_type, -> { Pinnacle::Rcs::Agents::Types::ListAgentsRequestAgentType }, optional: true, nullable: false, api_name: "agentType"
          field :name, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
