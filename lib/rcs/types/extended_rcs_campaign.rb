# frozen_string_literal: true

module Rcs
  module Types
    class ExtendedRcsCampaign < Internal::Types::Model
      field :agent, -> { Rcs::Types::RcsCampaignSchemaExtraAgent }, optional: false, nullable: false
      field :agent_id, -> { String }, optional: false, nullable: false, api_name: "agentId"
      field :brand, -> { Rcs::Types::ExtendedBrand }, optional: false, nullable: false
      field :campaign_id, -> { String }, optional: true, nullable: false, api_name: "campaignId"
      field :expected_agent_responses, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "expectedAgentResponses"
      field :links, -> { Rcs::Types::RcsCampaignSchemaExtraLinks }, optional: true, nullable: false
      field :status, -> { Rcs::Types::ProfileStatusEnum }, optional: false, nullable: false
      field :use_case, -> { Rcs::Types::RcsCampaignSchemaExtraUseCase }, optional: true, nullable: false, api_name: "useCase"
      field :opt_in_terms_and_conditions, -> { String }, optional: true, nullable: false, api_name: "optInTermsAndConditions"
      field :messaging_type, -> { Rcs::Types::RcsMessagingTypeEnum }, optional: true, nullable: false, api_name: "messagingType"
      field :carrier_description, -> { String }, optional: true, nullable: false, api_name: "carrierDescription"
      field :keywords, -> { Rcs::Types::RcsCampaignSchemaExtraKeywords }, optional: true, nullable: false
      field :traffic, -> { Rcs::Types::RcsCampaignSchemaExtraTraffic }, optional: true, nullable: false
      field :agent_triggers, -> { String }, optional: true, nullable: false, api_name: "agentTriggers"
      field :interaction_description, -> { String }, optional: true, nullable: false, api_name: "interactionDescription"
      field :is_conversational, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isConversational"
      field :cta_language, -> { String }, optional: true, nullable: false, api_name: "ctaLanguage"
      field :demo_trigger, -> { String }, optional: true, nullable: false, api_name: "demoTrigger"
    end
  end
end
