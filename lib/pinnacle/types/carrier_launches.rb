# frozen_string_literal: true

module Pinnacle
  module Types
    # Per-carrier launch status grouped by category. `carriers` covers
    # AT&T / T-Mobile / Verizon / other carriers; `verification` covers
    # the AEGIS and Google verification flows.
    class CarrierLaunches < Internal::Types::Model
      field :carriers, -> { Pinnacle::Types::CarrierLaunchesCarriers }, optional: false, nullable: false

      field :verification, -> { Pinnacle::Types::CarrierLaunchesVerification }, optional: false, nullable: false
    end
  end
end
