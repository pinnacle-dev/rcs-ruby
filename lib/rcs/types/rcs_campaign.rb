# frozen_string_literal: true

require_relative "rcs_campaign_schema_agent"
require_relative "rcs_campaign_schema_links"
require_relative "rcs_campaign_schema_opt_in"
require_relative "rcs_campaign_schema_opt_out"
require_relative "rcs_campaign_schema_use_case"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class RcsCampaign
      # @return [Pinnacle::Types::RcsCampaignSchemaAgent] Agent configured to the campaign.
      attr_reader :agent
      # @return [Integer] Unique identifier for the campaign.
      attr_reader :campaign_id
      # @return [Array<String>] List of what the agent might say to users.
      attr_reader :expected_agent_responses
      # @return [Pinnacle::Types::RcsCampaignSchemaLinks] Legal documentation links.
      attr_reader :links
      # @return [Pinnacle::Types::RcsCampaignSchemaOptIn] Opt-in configuration.
      attr_reader :opt_in
      # @return [Pinnacle::Types::RcsCampaignSchemaOptOut] Opt-out configuration.
      attr_reader :opt_out
      # @return [Pinnacle::Types::RcsCampaignSchemaUseCase] Use case classification for the campaign.
      attr_reader :use_case
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param agent [Pinnacle::Types::RcsCampaignSchemaAgent] Agent configured to the campaign.
      # @param campaign_id [Integer] Unique identifier for the campaign.
      # @param expected_agent_responses [Array<String>] List of what the agent might say to users.
      # @param links [Pinnacle::Types::RcsCampaignSchemaLinks] Legal documentation links.
      # @param opt_in [Pinnacle::Types::RcsCampaignSchemaOptIn] Opt-in configuration.
      # @param opt_out [Pinnacle::Types::RcsCampaignSchemaOptOut] Opt-out configuration.
      # @param use_case [Pinnacle::Types::RcsCampaignSchemaUseCase] Use case classification for the campaign.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RcsCampaign]
      def initialize(agent: OMIT, campaign_id: OMIT, expected_agent_responses: OMIT, links: OMIT, opt_in: OMIT,
                     opt_out: OMIT, use_case: OMIT, additional_properties: nil)
        @agent = agent if agent != OMIT
        @campaign_id = campaign_id if campaign_id != OMIT
        @expected_agent_responses = expected_agent_responses if expected_agent_responses != OMIT
        @links = links if links != OMIT
        @opt_in = opt_in if opt_in != OMIT
        @opt_out = opt_out if opt_out != OMIT
        @use_case = use_case if use_case != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "agent": agent,
          "campaignId": campaign_id,
          "expectedAgentResponses": expected_agent_responses,
          "links": links,
          "optIn": opt_in,
          "optOut": opt_out,
          "useCase": use_case
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RcsCampaign
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RcsCampaign]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
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
        if parsed_json["optIn"].nil?
          opt_in = nil
        else
          opt_in = parsed_json["optIn"].to_json
          opt_in = Pinnacle::Types::RcsCampaignSchemaOptIn.from_json(json_object: opt_in)
        end
        if parsed_json["optOut"].nil?
          opt_out = nil
        else
          opt_out = parsed_json["optOut"].to_json
          opt_out = Pinnacle::Types::RcsCampaignSchemaOptOut.from_json(json_object: opt_out)
        end
        if parsed_json["useCase"].nil?
          use_case = nil
        else
          use_case = parsed_json["useCase"].to_json
          use_case = Pinnacle::Types::RcsCampaignSchemaUseCase.from_json(json_object: use_case)
        end
        new(
          agent: agent,
          campaign_id: campaign_id,
          expected_agent_responses: expected_agent_responses,
          links: links,
          opt_in: opt_in,
          opt_out: opt_out,
          use_case: use_case,
          additional_properties: struct
        )
      end

      # Serialize an instance of RcsCampaign to a JSON object
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
        obj.agent.nil? || Pinnacle::Types::RcsCampaignSchemaAgent.validate_raw(obj: obj.agent)
        obj.campaign_id&.is_a?(Integer) != false || raise("Passed value for field obj.campaign_id is not the expected type, validation failed.")
        obj.expected_agent_responses&.is_a?(Array) != false || raise("Passed value for field obj.expected_agent_responses is not the expected type, validation failed.")
        obj.links.nil? || Pinnacle::Types::RcsCampaignSchemaLinks.validate_raw(obj: obj.links)
        obj.opt_in.nil? || Pinnacle::Types::RcsCampaignSchemaOptIn.validate_raw(obj: obj.opt_in)
        obj.opt_out.nil? || Pinnacle::Types::RcsCampaignSchemaOptOut.validate_raw(obj: obj.opt_out)
        obj.use_case.nil? || Pinnacle::Types::RcsCampaignSchemaUseCase.validate_raw(obj: obj.use_case)
      end
    end
  end
end
