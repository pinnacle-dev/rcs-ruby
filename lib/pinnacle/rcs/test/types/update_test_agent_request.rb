# frozen_string_literal: true

module Pinnacle
  module Rcs
    module Test
      module Types
        class UpdateTestAgentRequest < Internal::Types::Model
          field :agent_id, -> { String }, optional: false, nullable: false, api_name: "agentId"

          field :display_name, -> { String }, optional: true, nullable: false, api_name: "displayName"

          field :description, -> { String }, optional: true, nullable: false

          field :logo_url, -> { String }, optional: true, nullable: false, api_name: "logoUrl"

          field :hero_url, -> { String }, optional: true, nullable: false, api_name: "heroUrl"

          field :phone_numbers, -> { Internal::Types::Array[Pinnacle::Types::AgentPhoneEntry] }, optional: true, nullable: false, api_name: "phoneNumbers"

          field :emails, -> { Internal::Types::Array[Pinnacle::Types::AgentEmailEntry] }, optional: true, nullable: false

          field :websites, -> { Internal::Types::Array[Pinnacle::Types::AgentWebsiteEntry] }, optional: true, nullable: false

          field :privacy_url, -> { String }, optional: true, nullable: false, api_name: "privacyUrl"

          field :terms_url, -> { String }, optional: true, nullable: false, api_name: "termsUrl"

          field :color, -> { String }, optional: true, nullable: false

          field :is_conversational, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isConversational"

          field :agent_use_case, -> { Pinnacle::Types::AgentUseCase }, optional: true, nullable: false, api_name: "agentUseCase"
        end
      end
    end
  end
end
