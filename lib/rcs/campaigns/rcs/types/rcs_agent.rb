# frozen_string_literal: true

module Rcs
  module Campaigns
    module Rcs
      module Types
        # Create an agent for the campaign.
        class RcsAgent < Internal::Types::Model
          field :color, -> { String }, optional: true, nullable: false
          field :description, -> { String }, optional: true, nullable: false
          field :emails, -> { Internal::Types::Array[Rcs::Campaigns::Rcs::Types::RcsAgentEmail] }, optional: true, nullable: false
          field :hero_url, -> { String }, optional: true, nullable: false, api_name: "heroUrl"
          field :icon_url, -> { String }, optional: true, nullable: false, api_name: "iconUrl"
          field :name, -> { String }, optional: true, nullable: false
          field :phones, -> { Internal::Types::Array[Rcs::Campaigns::Rcs::Types::RcsAgentPhone] }, optional: true, nullable: false
          field :websites, -> { Internal::Types::Array[Rcs::Campaigns::Rcs::Types::RcsAgentWebsite] }, optional: true, nullable: false
        end
      end
    end
  end
end
