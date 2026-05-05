# frozen_string_literal: true

module Pinnacle
  module Types
    class ListAgentsResponse < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Pinnacle::Types::AgentSummary] }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "hasMore"

      field :count, -> { Integer }, optional: false, nullable: false
    end
  end
end
