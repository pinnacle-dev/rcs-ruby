# frozen_string_literal: true

module Rcs
  module Types
    class RcsCampaignSchemaExtraTraffic < Internal::Types::Model
      field :monthly_website, -> { Integer }, optional: true, nullable: false, api_name: "monthlyWebsite"
      field :monthly_rcs_estimate, -> { Integer }, optional: true, nullable: false, api_name: "monthlyRcsEstimate"
    end
  end
end
