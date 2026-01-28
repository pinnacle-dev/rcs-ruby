# frozen_string_literal: true

module Pinnacle
  module Campaigns
    module Dlc
      module Types
        # Campaign configuration options.
        class DlcCampaignOptions < Internal::Types::Model
          field :affiliate_marketing, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "affiliateMarketing"
          field :age_gated, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "ageGated"
          field :direct_lending, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "directLending"
          field :embedded_link, -> { String }, optional: true, nullable: false, api_name: "embeddedLink"
          field :embedded_phone, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "embeddedPhone"
          field :number_pooling, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "numberPooling"
        end
      end
    end
  end
end
