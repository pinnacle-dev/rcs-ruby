# frozen_string_literal: true

module Pinnacle
  module Types
    # Per-carrier launch status.
    class CarrierLaunches < Internal::Types::Model
      field :att, -> { Pinnacle::Types::CarrierLaunchStatus }, optional: false, nullable: false, api_name: "ATT"
      field :tmobile, -> { Pinnacle::Types::CarrierLaunchStatus }, optional: false, nullable: false, api_name: "TMOBILE"
      field :verizon, -> { Pinnacle::Types::CarrierLaunchStatus }, optional: false, nullable: false, api_name: "VERIZON"
      field :others, -> { Pinnacle::Types::CarrierLaunchStatus }, optional: false, nullable: false, api_name: "OTHERS"
    end
  end
end
