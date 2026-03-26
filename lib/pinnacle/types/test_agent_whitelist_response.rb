# frozen_string_literal: true

module Pinnacle
  module Types
    # Response containing the whitelist status of a phone number.
    class TestAgentWhitelistResponse < Internal::Types::Model
      field :status, -> { Pinnacle::Types::RcsWhitelistStatus }, optional: false, nullable: false
    end
  end
end
