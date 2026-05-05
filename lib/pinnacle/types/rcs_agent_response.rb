# frozen_string_literal: true

module Pinnacle
  module Types
    # Response containing details of an RCS agent.
    class RcsAgentResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :type, -> { String }, optional: false, nullable: false

      field :service_id, -> { String }, optional: false, nullable: false, api_name: "serviceId"

      field :carrier_launches, -> { Pinnacle::Types::CarrierLaunches }, optional: false, nullable: false, api_name: "carrierLaunches"

      field :details, -> { Pinnacle::Types::RcsAgentDetails }, optional: false, nullable: false
    end
  end
end
