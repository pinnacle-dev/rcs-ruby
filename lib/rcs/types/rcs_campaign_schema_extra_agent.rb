# frozen_string_literal: true

module Rcs
  module Types
    # Agent configured to the campaign.
    class RcsCampaignSchemaExtraAgent < Internal::Types::Model
      field :color, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :emails, -> { Internal::Types::Array[Rcs::Types::RcsCampaignSchemaExtraAgentEmailsItem] }, optional: false, nullable: false
      field :hero_url, -> { String }, optional: true, nullable: false, api_name: "heroUrl"
      field :icon_url, -> { String }, optional: true, nullable: false, api_name: "iconUrl"
      field :name, -> { String }, optional: true, nullable: false
      field :phones, -> { Internal::Types::Array[Rcs::Types::RcsCampaignSchemaExtraAgentPhonesItem] }, optional: false, nullable: false
      field :websites, -> { Internal::Types::Array[Rcs::Types::RcsCampaignSchemaExtraAgentWebsitesItem] }, optional: false, nullable: false
    end
  end
end
