# frozen_string_literal: true

module Pinnacle
  module Campaigns
    module Rcs
      module Types
        class UpsertRcsCampaignParams < Internal::Types::Model
          field :agent, -> { Pinnacle::Campaigns::Rcs::Types::RcsAgent }, optional: true, nullable: false
          field :brand, -> { String }, optional: true, nullable: false
          field :campaign_id, -> { String }, optional: true, nullable: false, api_name: "campaignId"
          field :expected_agent_responses, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "expectedAgentResponses"
          field :links, -> { Pinnacle::Campaigns::Rcs::Types::RcsLinks }, optional: true, nullable: false
          field :use_case_description, -> { String }, optional: true, nullable: false, api_name: "useCaseDescription"
          field :messaging_type, -> { Pinnacle::Types::RcsMessagingTypeEnum }, optional: true, nullable: false, api_name: "messagingType"
          field :cta_media, -> { String }, optional: true, nullable: false, api_name: "ctaMedia"
          field :opt_in_method, -> { String }, optional: true, nullable: false, api_name: "optInMethod"
          field :keywords, -> { Pinnacle::Campaigns::Rcs::Types::RcsCampaignKeywords }, optional: true, nullable: false
          field :traffic, -> { Pinnacle::Campaigns::Rcs::Types::RcsCampaignTraffic }, optional: true, nullable: false
          field :cta_language, -> { String }, optional: true, nullable: false, api_name: "ctaLanguage"
          field :demo_trigger, -> { String }, optional: true, nullable: false, api_name: "demoTrigger"
        end
      end
    end
  end
end
