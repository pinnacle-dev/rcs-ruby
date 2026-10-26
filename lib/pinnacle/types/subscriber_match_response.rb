# frozen_string_literal: true

module Pinnacle
  module Types
    class SubscriberMatchResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false, api_name: "requestId"

      field :status, -> { Pinnacle::Types::NetworkInsightStatus }, optional: false, nullable: false

      field :matches, -> { Pinnacle::Types::SubscriberMatchResponseMatches }, optional: false, nullable: false
    end
  end
end
