# frozen_string_literal: true

module Pinnacle
  module Types
    class RcsCampaign < Internal::Types::Model
      field :agent, -> { Pinnacle::Types::RcsCampaignSchemaAgent }, optional: true, nullable: false
      field :campaign_id, -> { String }, optional: true, nullable: false, api_name: "campaignId"
      field :expected_agent_responses, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "expectedAgentResponses"
      field :links, -> { Pinnacle::Types::RcsCampaignSchemaLinks }, optional: true, nullable: false
      field :use_case_description, -> { String }, optional: true, nullable: false, api_name: "useCaseDescription"
      field :messaging_type, -> { Pinnacle::Types::RcsMessagingTypeEnum }, optional: true, nullable: false, api_name: "messagingType"
      field :cta_media, -> { String }, optional: true, nullable: false, api_name: "ctaMedia"
      field :opt_in_method, -> { String }, optional: true, nullable: false, api_name: "optInMethod"
      field :keywords, -> { Pinnacle::Types::RcsCampaignSchemaKeywords }, optional: true, nullable: false
      field :traffic, -> { Pinnacle::Types::RcsCampaignSchemaTraffic }, optional: true, nullable: false
      field :cta_language, -> { String }, optional: true, nullable: false, api_name: "ctaLanguage"
      field :demo_trigger, -> { String }, optional: true, nullable: false, api_name: "demoTrigger"
    end
  end
end
