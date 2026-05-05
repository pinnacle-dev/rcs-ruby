# frozen_string_literal: true

module Pinnacle
  module Rcs
    module Test
      module Types
        class TestGetWhitelistStatusRequest < Internal::Types::Model
          field :agent_id, -> { String }, optional: false, nullable: false, api_name: "agentId"

          field :phone_number, -> { String }, optional: false, nullable: false, api_name: "phoneNumber"
        end
      end
    end
  end
end
