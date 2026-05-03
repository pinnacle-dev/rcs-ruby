# frozen_string_literal: true

module Pinnacle
  module Types
    # Resolved per-key launch status for the campaign's agent. Carrier
    # statuses live under `carriers` and verifier statuses under
    # `verification`.
    class CampaignStatusEventCarrierLaunches < Internal::Types::Model
      field :carriers, -> { Pinnacle::Types::CampaignStatusEventCarrierLaunchesCarriers }, optional: false, nullable: false
      field :verification, -> { Pinnacle::Types::CampaignStatusEventCarrierLaunchesVerification }, optional: false, nullable: false
    end
  end
end
