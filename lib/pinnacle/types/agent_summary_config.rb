# frozen_string_literal: true

module Pinnacle
  module Types
    # Agent configuration details.
    class AgentSummaryConfig < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :color, -> { String }, optional: true, nullable: false
      field :websites, -> { Internal::Types::Array[Pinnacle::Types::AgentSummaryConfigWebsitesItem] }, optional: true, nullable: false
      field :phones, -> { Internal::Types::Array[Pinnacle::Types::AgentSummaryConfigPhonesItem] }, optional: true, nullable: false
      field :emails, -> { Internal::Types::Array[Pinnacle::Types::AgentSummaryConfigEmailsItem] }, optional: true, nullable: false
      field :icon_url, -> { String }, optional: true, nullable: false, api_name: "iconUrl"
      field :hero_url, -> { String }, optional: true, nullable: false, api_name: "heroUrl"
      field :privacy_url, -> { String }, optional: true, nullable: false, api_name: "privacyUrl"
      field :terms_url, -> { String }, optional: true, nullable: false, api_name: "termsUrl"
      field :is_conversational, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isConversational"
      field :agent_use_case, -> { Pinnacle::Types::AgentSummaryConfigAgentUseCase }, optional: true, nullable: false, api_name: "agentUseCase"
    end
  end
end
