# frozen_string_literal: true

module Pinnacle
  module Types
    class ExtendedRcsCampaign < Internal::Types::Model
      field :agent, -> { Pinnacle::Types::RcsCampaignSchemaExtraAgent }, optional: false, nullable: false
      field :agent_id, -> { String }, optional: false, nullable: false, api_name: "agentId"
      field :brand, -> { Pinnacle::Types::ExtendedBrand }, optional: false, nullable: false
      field :campaign_id, -> { String }, optional: true, nullable: false, api_name: "campaignId"
      field :expected_agent_responses, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "expectedAgentResponses"
      field :links, -> { Pinnacle::Types::RcsCampaignSchemaExtraLinks }, optional: true, nullable: false
      field :status, -> { Pinnacle::Types::ProfileStatusEnum }, optional: false, nullable: false
      field :use_case, -> { Pinnacle::Types::RcsCampaignSchemaExtraUseCase }, optional: true, nullable: false, api_name: "useCase"
      field :opt_in_terms_and_conditions, -> { String }, optional: true, nullable: false, api_name: "optInTermsAndConditions"
      field :messaging_type, -> { Pinnacle::Types::RcsMessagingTypeEnum }, optional: true, nullable: false, api_name: "messagingType"
      field :carrier_description, -> { String }, optional: true, nullable: false, api_name: "carrierDescription"
      field :keywords, -> { Pinnacle::Types::RcsCampaignSchemaExtraKeywords }, optional: true, nullable: false
      field :traffic, -> { Pinnacle::Types::RcsCampaignSchemaExtraTraffic }, optional: true, nullable: false
      field :agent_triggers, -> { String }, optional: true, nullable: false, api_name: "agentTriggers"
      field :interaction_description, -> { String }, optional: true, nullable: false, api_name: "interactionDescription"
      field :is_conversational, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isConversational"
      field :cta_language, -> { String }, optional: true, nullable: false, api_name: "ctaLanguage"
      field :demo_trigger, -> { String }, optional: true, nullable: false, api_name: "demoTrigger"
    end
  end
end
