# frozen_string_literal: true

module Pinnacle
  module Rcs
    module Test
      module Types
        class CreateTestAgentRequest < Internal::Types::Model
          field :display_name, -> { String }, optional: false, nullable: false, api_name: "displayName"

          field :description, -> { String }, optional: false, nullable: false

          field :logo_url, -> { String }, optional: false, nullable: false, api_name: "logoUrl"

          field :hero_url, -> { String }, optional: false, nullable: false, api_name: "heroUrl"

          field :phone_numbers, -> { Internal::Types::Array[Pinnacle::Types::AgentPhoneEntry] }, optional: false, nullable: false, api_name: "phoneNumbers"

          field :emails, -> { Internal::Types::Array[Pinnacle::Types::AgentEmailEntry] }, optional: false, nullable: false

          field :websites, -> { Internal::Types::Array[Pinnacle::Types::AgentWebsiteEntry] }, optional: false, nullable: false

          field :privacy_url, -> { String }, optional: false, nullable: false, api_name: "privacyUrl"

          field :terms_url, -> { String }, optional: false, nullable: false, api_name: "termsUrl"

          field :color, -> { String }, optional: false, nullable: false

          field :is_conversational, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isConversational"

          field :agent_use_case, -> { Pinnacle::Types::AgentUseCase }, optional: true, nullable: false, api_name: "agentUseCase"
        end
      end
    end
  end
end
