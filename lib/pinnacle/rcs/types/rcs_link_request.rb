# frozen_string_literal: true

module Pinnacle
  module Rcs
    module Types
      class RcsLinkRequest < Internal::Types::Model
        field :agent_id, -> { String }, optional: false, nullable: false, api_name: "agentId"
        field :test_mode, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "testMode"
        field :phone_number, -> { String }, optional: true, nullable: false, api_name: "phoneNumber"
        field :body, -> { String }, optional: true, nullable: false
      end
    end
  end
end
