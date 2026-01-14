# frozen_string_literal: true

module Pinnacle
  module Types
    # Campaign configuration options.
    class TollFreeWithExtendedBrandAndStatusOptions < Internal::Types::Model
      field :age_gated, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "ageGated"
    end
  end
end
