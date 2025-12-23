# frozen_string_literal: true

require_relative "../../../types/rcs_campaign_schema_agent"
require_relative "../../../types/rcs_campaign_schema_links"
require_relative "../../../types/rcs_campaign_schema_use_case"
require_relative "../../../types/rcs_messaging_type_enum"
require_relative "../../../types/rcs_campaign_schema_keywords"
require_relative "../../../types/rcs_campaign_schema_traffic"
require "ostruct"
require "json"

module Pinnacle
  module Campaigns
    module Rcs
      module Types
        class RcsAutofillResponse
          # @return [String]
          attr_reader :brand
          # @return [Pinnacle::Types::RcsCampaignSchemaAgent] Agent configured to the campaign.
          attr_reader :agent
          # @return [String] Unique identifier for the campaign.
          attr_reader :campaign_id
          # @return [Array<String>] List of what the agent might say to users.
          attr_reader :expected_agent_responses
          # @return [Pinnacle::Types::RcsCampaignSchemaLinks] Legal documentation links.
          attr_reader :links
          # @return [Pinnacle::Types::RcsCampaignSchemaUseCase] Use case classification for the campaign.
          attr_reader :use_case
          # @return [String] Details on how opt-in is acquired. If it is done through a website or app,
          #  provide the link.
          attr_reader :opt_in_terms_and_conditions
          # @return [Pinnacle::Types::RcsMessagingTypeEnum]
          attr_reader :messaging_type
          # @return [String] Description of the agent's purpose, shown to carriers for approval.
          attr_reader :carrier_description
          # @return [Pinnacle::Types::RcsCampaignSchemaKeywords]
          attr_reader :keywords
          # @return [Pinnacle::Types::RcsCampaignSchemaTraffic]
          attr_reader :traffic
          # @return [String] Explanation of how the agent is triggered. This includes how the first message
          #  is delivered, whether messages follow a schedule or triggered by user actions,
          #  and any external triggers.
          attr_reader :agent_triggers
          # @return [String] Description of all agent interactions.
          attr_reader :interaction_description
          # @return [Boolean] Whether the agent supports conversational flows or respond to P2A messages from
          #  the users. Set to false for one-way messages from agent to user.
          attr_reader :is_conversational
          # @return [String] Required text that appears next to the opt-in checkbox for your opt-in form.
          #  This checkbox has to be unchecked by default. The text should meet the US CTIA
          #  requirements and is usually in the following format: <br>
          #  [Program description of the company sending the messages and what type of
          #  messages are being sent]. Msg&data rates may apply. [Message frequency: How
          #  frequently messages are sent]. [Privacy statement or link to privacy policy].
          #  [Link to full mobile
          #  T&Cs page].
          attr_reader :cta_language
          # @return [String] Instructions on how an external reviewer can trigger messages and an example
          #  flow from the agent. This is usually an inbound text message to the agent that
          #  will start a flow of messages between the agent and the user.
          attr_reader :demo_trigger
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param brand [String]
          # @param agent [Pinnacle::Types::RcsCampaignSchemaAgent] Agent configured to the campaign.
          # @param campaign_id [String] Unique identifier for the campaign.
          # @param expected_agent_responses [Array<String>] List of what the agent might say to users.
          # @param links [Pinnacle::Types::RcsCampaignSchemaLinks] Legal documentation links.
          # @param use_case [Pinnacle::Types::RcsCampaignSchemaUseCase] Use case classification for the campaign.
          # @param opt_in_terms_and_conditions [String] Details on how opt-in is acquired. If it is done through a website or app,
          #  provide the link.
          # @param messaging_type [Pinnacle::Types::RcsMessagingTypeEnum]
          # @param carrier_description [String] Description of the agent's purpose, shown to carriers for approval.
          # @param keywords [Pinnacle::Types::RcsCampaignSchemaKeywords]
          # @param traffic [Pinnacle::Types::RcsCampaignSchemaTraffic]
          # @param agent_triggers [String] Explanation of how the agent is triggered. This includes how the first message
          #  is delivered, whether messages follow a schedule or triggered by user actions,
          #  and any external triggers.
          # @param interaction_description [String] Description of all agent interactions.
          # @param is_conversational [Boolean] Whether the agent supports conversational flows or respond to P2A messages from
          #  the users. Set to false for one-way messages from agent to user.
          # @param cta_language [String] Required text that appears next to the opt-in checkbox for your opt-in form.
          #  This checkbox has to be unchecked by default. The text should meet the US CTIA
          #  requirements and is usually in the following format: <br>
          #  [Program description of the company sending the messages and what type of
          #  messages are being sent]. Msg&data rates may apply. [Message frequency: How
          #  frequently messages are sent]. [Privacy statement or link to privacy policy].
          #  [Link to full mobile
          #  T&Cs page].
          # @param demo_trigger [String] Instructions on how an external reviewer can trigger messages and an example
          #  flow from the agent. This is usually an inbound text message to the agent that
          #  will start a flow of messages between the agent and the user.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [Pinnacle::Campaigns::Rcs::Types::RcsAutofillResponse]
          def initialize(brand: OMIT, agent: OMIT, campaign_id: OMIT, expected_agent_responses: OMIT, links: OMIT,
                         use_case: OMIT, opt_in_terms_and_conditions: OMIT, messaging_type: OMIT, carrier_description: OMIT, keywords: OMIT, traffic: OMIT, agent_triggers: OMIT, interaction_description: OMIT, is_conversational: OMIT, cta_language: OMIT, demo_trigger: OMIT, additional_properties: nil)
            @brand = brand if brand != OMIT
            @agent = agent if agent != OMIT
            @campaign_id = campaign_id if campaign_id != OMIT
            @expected_agent_responses = expected_agent_responses if expected_agent_responses != OMIT
            @links = links if links != OMIT
            @use_case = use_case if use_case != OMIT
            @opt_in_terms_and_conditions = opt_in_terms_and_conditions if opt_in_terms_and_conditions != OMIT
            @messaging_type = messaging_type if messaging_type != OMIT
            @carrier_description = carrier_description if carrier_description != OMIT
            @keywords = keywords if keywords != OMIT
            @traffic = traffic if traffic != OMIT
            @agent_triggers = agent_triggers if agent_triggers != OMIT
            @interaction_description = interaction_description if interaction_description != OMIT
            @is_conversational = is_conversational if is_conversational != OMIT
            @cta_language = cta_language if cta_language != OMIT
            @demo_trigger = demo_trigger if demo_trigger != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "brand": brand,
              "agent": agent,
              "campaignId": campaign_id,
              "expectedAgentResponses": expected_agent_responses,
              "links": links,
              "useCase": use_case,
              "optInTermsAndConditions": opt_in_terms_and_conditions,
              "messagingType": messaging_type,
              "carrierDescription": carrier_description,
              "keywords": keywords,
              "traffic": traffic,
              "agentTriggers": agent_triggers,
              "interactionDescription": interaction_description,
              "isConversational": is_conversational,
              "ctaLanguage": cta_language,
              "demoTrigger": demo_trigger
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of RcsAutofillResponse
          #
          # @param json_object [String]
          # @return [Pinnacle::Campaigns::Rcs::Types::RcsAutofillResponse]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            brand = parsed_json["brand"]
            if parsed_json["agent"].nil?
              agent = nil
            else
              agent = parsed_json["agent"].to_json
              agent = Pinnacle::Types::RcsCampaignSchemaAgent.from_json(json_object: agent)
            end
            campaign_id = parsed_json["campaignId"]
            expected_agent_responses = parsed_json["expectedAgentResponses"]
            if parsed_json["links"].nil?
              links = nil
            else
              links = parsed_json["links"].to_json
              links = Pinnacle::Types::RcsCampaignSchemaLinks.from_json(json_object: links)
            end
            if parsed_json["useCase"].nil?
              use_case = nil
            else
              use_case = parsed_json["useCase"].to_json
              use_case = Pinnacle::Types::RcsCampaignSchemaUseCase.from_json(json_object: use_case)
            end
            opt_in_terms_and_conditions = parsed_json["optInTermsAndConditions"]
            messaging_type = parsed_json["messagingType"]
            carrier_description = parsed_json["carrierDescription"]
            if parsed_json["keywords"].nil?
              keywords = nil
            else
              keywords = parsed_json["keywords"].to_json
              keywords = Pinnacle::Types::RcsCampaignSchemaKeywords.from_json(json_object: keywords)
            end
            if parsed_json["traffic"].nil?
              traffic = nil
            else
              traffic = parsed_json["traffic"].to_json
              traffic = Pinnacle::Types::RcsCampaignSchemaTraffic.from_json(json_object: traffic)
            end
            agent_triggers = parsed_json["agentTriggers"]
            interaction_description = parsed_json["interactionDescription"]
            is_conversational = parsed_json["isConversational"]
            cta_language = parsed_json["ctaLanguage"]
            demo_trigger = parsed_json["demoTrigger"]
            new(
              brand: brand,
              agent: agent,
              campaign_id: campaign_id,
              expected_agent_responses: expected_agent_responses,
              links: links,
              use_case: use_case,
              opt_in_terms_and_conditions: opt_in_terms_and_conditions,
              messaging_type: messaging_type,
              carrier_description: carrier_description,
              keywords: keywords,
              traffic: traffic,
              agent_triggers: agent_triggers,
              interaction_description: interaction_description,
              is_conversational: is_conversational,
              cta_language: cta_language,
              demo_trigger: demo_trigger,
              additional_properties: struct
            )
          end

          # Serialize an instance of RcsAutofillResponse to a JSON object
          #
          # @return [String]
          def to_json(*_args)
            @_field_set&.to_json
          end

          # Leveraged for Union-type generation, validate_raw attempts to parse the given
          #  hash and check each fields type against the current object's property
          #  definitions.
          #
          # @param obj [Object]
          # @return [Void]
          def self.validate_raw(obj:)
            obj.brand&.is_a?(String) != false || raise("Passed value for field obj.brand is not the expected type, validation failed.")
            obj.agent.nil? || Pinnacle::Types::RcsCampaignSchemaAgent.validate_raw(obj: obj.agent)
            obj.campaign_id&.is_a?(String) != false || raise("Passed value for field obj.campaign_id is not the expected type, validation failed.")
            obj.expected_agent_responses&.is_a?(Array) != false || raise("Passed value for field obj.expected_agent_responses is not the expected type, validation failed.")
            obj.links.nil? || Pinnacle::Types::RcsCampaignSchemaLinks.validate_raw(obj: obj.links)
            obj.use_case.nil? || Pinnacle::Types::RcsCampaignSchemaUseCase.validate_raw(obj: obj.use_case)
            obj.opt_in_terms_and_conditions&.is_a?(String) != false || raise("Passed value for field obj.opt_in_terms_and_conditions is not the expected type, validation failed.")
            obj.messaging_type&.is_a?(Pinnacle::Types::RcsMessagingTypeEnum) != false || raise("Passed value for field obj.messaging_type is not the expected type, validation failed.")
            obj.carrier_description&.is_a?(String) != false || raise("Passed value for field obj.carrier_description is not the expected type, validation failed.")
            obj.keywords.nil? || Pinnacle::Types::RcsCampaignSchemaKeywords.validate_raw(obj: obj.keywords)
            obj.traffic.nil? || Pinnacle::Types::RcsCampaignSchemaTraffic.validate_raw(obj: obj.traffic)
            obj.agent_triggers&.is_a?(String) != false || raise("Passed value for field obj.agent_triggers is not the expected type, validation failed.")
            obj.interaction_description&.is_a?(String) != false || raise("Passed value for field obj.interaction_description is not the expected type, validation failed.")
            obj.is_conversational&.is_a?(Boolean) != false || raise("Passed value for field obj.is_conversational is not the expected type, validation failed.")
            obj.cta_language&.is_a?(String) != false || raise("Passed value for field obj.cta_language is not the expected type, validation failed.")
            obj.demo_trigger&.is_a?(String) != false || raise("Passed value for field obj.demo_trigger is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
