# frozen_string_literal: true

module Pinnacle
  module Rcs
    module Types
      class RcsCapabilitiesQuery < Internal::Types::Model
        field :phone_numbers, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "phoneNumbers"
      end
    end
  end
end
