# frozen_string_literal: true

module Pinnacle
  module Types
    class AgentSummary < Internal::Types::Model
      field :agent_id, -> { String }, optional: false, nullable: false, api_name: "agentId"

      field :agent_type, -> { Pinnacle::Types::AgentSummaryAgentType }, optional: false, nullable: false, api_name: "agentType"

      field :service_id, -> { String }, optional: true, nullable: false, api_name: "serviceId"

      field :carrier_launches, -> { Pinnacle::Types::AgentSummaryCarrierLaunches }, optional: true, nullable: false, api_name: "carrierLaunches"

      field :config, -> { Pinnacle::Types::AgentSummaryConfig }, optional: true, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
