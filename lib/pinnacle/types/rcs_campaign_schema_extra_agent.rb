# frozen_string_literal: true

module Pinnacle
  module Types
    # Agent configured to the campaign.
    class RcsCampaignSchemaExtraAgent < Internal::Types::Model
      field :color, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :emails, -> { Internal::Types::Array[Pinnacle::Types::RcsCampaignSchemaExtraAgentEmailsItem] }, optional: false, nullable: false
      field :hero_url, -> { String }, optional: true, nullable: false, api_name: "heroUrl"
      field :icon_url, -> { String }, optional: true, nullable: false, api_name: "iconUrl"
      field :name, -> { String }, optional: true, nullable: false
      field :phones, -> { Internal::Types::Array[Pinnacle::Types::RcsCampaignSchemaExtraAgentPhonesItem] }, optional: false, nullable: false
      field :websites, -> { Internal::Types::Array[Pinnacle::Types::RcsCampaignSchemaExtraAgentWebsitesItem] }, optional: false, nullable: false
    end
  end
end
