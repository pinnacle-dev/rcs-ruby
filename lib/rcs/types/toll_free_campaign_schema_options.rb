# frozen_string_literal: true

module Rcs
  module Types
    # Campaign configuration options.
    class TollFreeCampaignSchemaOptions < Internal::Types::Model
      field :age_gated, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "ageGated"
    end
  end
end
