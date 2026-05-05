# frozen_string_literal: true

module Pinnacle
  module Types
    # Response returned after creating or updating a test agent.
    class TestAgentResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :type, -> { String }, optional: false, nullable: false

      field :service_id, -> { String }, optional: false, nullable: false, api_name: "serviceId"

      field :details, -> { Pinnacle::Types::RcsAgentDetails }, optional: false, nullable: false
    end
  end
end
