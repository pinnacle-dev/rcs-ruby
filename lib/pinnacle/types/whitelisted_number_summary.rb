# frozen_string_literal: true

module Pinnacle
  module Types
    class WhitelistedNumberSummary < Internal::Types::Model
      field :number, -> { String }, optional: false, nullable: false

      field :status, -> { Pinnacle::Types::WhitelistedNumberSummaryStatus }, optional: false, nullable: false

      field :agent_id, -> { String }, optional: false, nullable: false, api_name: "agentId"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
    end
  end
end
