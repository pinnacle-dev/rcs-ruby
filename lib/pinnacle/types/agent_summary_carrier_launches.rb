# frozen_string_literal: true

module Pinnacle
  module Types
    # Per-carrier launch status for the agent.
    class AgentSummaryCarrierLaunches < Internal::Types::Model
      field :att, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "ATT"
      field :others, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "OTHERS"
      field :tmobile, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "TMOBILE"
      field :verizon, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "VERIZON"
    end
  end
end
