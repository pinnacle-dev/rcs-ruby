# frozen_string_literal: true

module Pinnacle
  module Types
    class SimSwapResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false, api_name: "requestId"

      field :status, -> { Pinnacle::Types::NetworkInsightStatus }, optional: false, nullable: false

      field :sim_swapped, -> { Internal::Types::Boolean }, optional: false, nullable: true, api_name: "simSwapped"

      field :latest_sim_swap_at, -> { String }, optional: false, nullable: true, api_name: "latestSimSwapAt"
    end
  end
end
