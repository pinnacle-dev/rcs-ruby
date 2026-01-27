# frozen_string_literal: true

module Rcs
  module Campaigns
    module Rcs
      module Types
        class UpsertRcsCampaignParams < Internal::Types::Model
          field :agent, -> { Rcs::Campaigns::Rcs::Types::RcsAgent }, optional: true, nullable: false
          field :brand, -> { String }, optional: true, nullable: false
          field :campaign_id, -> { String }, optional: true, nullable: false, api_name: "campaignId"
          field :expected_agent_responses, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "expectedAgentResponses"
          field :links, -> { Rcs::Campaigns::Rcs::Types::RcsLinks }, optional: true, nullable: false
          field :use_case, -> { Rcs::Campaigns::Rcs::Types::RcsUseCase }, optional: true, nullable: false, api_name: "useCase"
          field :opt_in_terms_and_conditions, -> { String }, optional: true, nullable: false, api_name: "optInTermsAndConditions"
          field :messaging_type, -> { Rcs::Types::RcsMessagingTypeEnum }, optional: true, nullable: false, api_name: "messagingType"
          field :carrier_description, -> { String }, optional: true, nullable: false, api_name: "carrierDescription"
          field :keywords, -> { Rcs::Campaigns::Rcs::Types::RcsCampaignKeywords }, optional: true, nullable: false
          field :traffic, -> { Rcs::Campaigns::Rcs::Types::RcsCampaignTraffic }, optional: true, nullable: false
          field :agent_triggers, -> { String }, optional: true, nullable: false, api_name: "agentTriggers"
          field :interaction_description, -> { String }, optional: true, nullable: false, api_name: "interactionDescription"
          field :is_conversational, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isConversational"
          field :cta_language, -> { String }, optional: true, nullable: false, api_name: "ctaLanguage"
          field :demo_trigger, -> { String }, optional: true, nullable: false, api_name: "demoTrigger"
        end
      end
    end
  end
end
