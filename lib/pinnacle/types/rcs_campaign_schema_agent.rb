# frozen_string_literal: true

module Pinnacle
  module Types
    # Agent configured to the campaign.
    class RcsCampaignSchemaAgent < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :color, -> { String }, optional: true, nullable: false
      field :emails, -> { Internal::Types::Array[Pinnacle::Types::RcsCampaignSchemaAgentEmailsItem] }, optional: true, nullable: false
      field :phones, -> { Internal::Types::Array[Pinnacle::Types::RcsCampaignSchemaAgentPhonesItem] }, optional: true, nullable: false
      field :websites, -> { Internal::Types::Array[Pinnacle::Types::RcsCampaignSchemaAgentWebsitesItem] }, optional: true, nullable: false
      field :hero_url, -> { String }, optional: true, nullable: false, api_name: "heroUrl"
      field :icon_url, -> { String }, optional: true, nullable: false, api_name: "iconUrl"
    end
  end
end
