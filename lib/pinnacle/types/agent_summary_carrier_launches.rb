# frozen_string_literal: true

module Pinnacle
  module Types
    # Raw per-carrier launch + verification state for the agent. Each
    # value is tri-state — `null` means "no launch requested" or "not
    # sent yet"; `false` means "pending" / "sent"; `true` means
    # "launched" / "verified". Use the [GET /rcs/{agentId}](/api-reference/rcs-agents/get)
    # endpoint for the resolved enum representation.
    class AgentSummaryCarrierLaunches < Internal::Types::Model
      field :att, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "ATT"

      field :others, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "OTHERS"

      field :tmobile, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "TMOBILE"

      field :verizon, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "VERIZON"

      field :aegis, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "AEGIS"

      field :google, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "GOOGLE"
    end
  end
end
