# frozen_string_literal: true

module Pinnacle
  module Types
    # Response indicating success of whitelisting operation
    class RcsWhitelistResponse < Internal::Types::Model
      field :success, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
