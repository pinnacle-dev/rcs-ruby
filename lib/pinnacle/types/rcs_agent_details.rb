# frozen_string_literal: true

module Pinnacle
  module Types
    # The configuration details of an RCS agent, as returned by the GET endpoint.
    class RcsAgentDetails < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :icon_url, -> { String }, optional: true, nullable: false, api_name: "iconUrl"

      field :hero_url, -> { String }, optional: true, nullable: false, api_name: "heroUrl"

      field :color, -> { String }, optional: true, nullable: false

      field :phones, -> { Internal::Types::Array[Pinnacle::Types::RcsAgentDetailsPhonesItem] }, optional: true, nullable: false

      field :emails, -> { Internal::Types::Array[Pinnacle::Types::RcsAgentDetailsEmailsItem] }, optional: true, nullable: false

      field :websites, -> { Internal::Types::Array[Pinnacle::Types::RcsAgentDetailsWebsitesItem] }, optional: true, nullable: false

      field :privacy_url, -> { String }, optional: true, nullable: false, api_name: "privacyUrl"

      field :terms_url, -> { String }, optional: true, nullable: false, api_name: "termsUrl"

      field :is_conversational, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isConversational"

      field :agent_use_case, -> { Pinnacle::Types::RcsAgentDetailsAgentUseCase }, optional: true, nullable: false, api_name: "agentUseCase"
    end
  end
end
