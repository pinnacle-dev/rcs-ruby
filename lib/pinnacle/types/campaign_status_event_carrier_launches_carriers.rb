# frozen_string_literal: true

module Pinnacle
  module Types
    # Per-carrier launch status. Each carrier moves through
    # `NOT_LAUNCHED` → `PENDING` → `LAUNCHED` as Pinnacle submits the
    # agent for review and the carrier accepts it. The agent is only
    # deliverable on a carrier once that carrier reports `LAUNCHED`.
    class CampaignStatusEventCarrierLaunchesCarriers < Internal::Types::Model
      field :att, -> { Pinnacle::Types::CarrierLaunchStatus }, optional: false, nullable: false, api_name: "ATT"

      field :tmobile, -> { Pinnacle::Types::CarrierLaunchStatus }, optional: false, nullable: false, api_name: "TMOBILE"

      field :verizon, -> { Pinnacle::Types::CarrierLaunchStatus }, optional: false, nullable: false, api_name: "VERIZON"

      field :others, -> { Pinnacle::Types::CarrierLaunchStatus }, optional: false, nullable: false, api_name: "OTHERS"
    end
  end
end
