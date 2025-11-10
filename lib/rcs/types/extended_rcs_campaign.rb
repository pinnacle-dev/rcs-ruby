# frozen_string_literal: true

require_relative "rcs_campaign_schema_extra_agent"
require_relative "extended_brand"
require_relative "rcs_campaign_schema_extra_links"
require_relative "profile_status_enum"
require_relative "rcs_campaign_schema_extra_opt_in"
require_relative "rcs_campaign_schema_extra_opt_out"
require_relative "rcs_campaign_schema_extra_use_case"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class ExtendedRcsCampaign
      # @return [Pinnacle::Types::RcsCampaignSchemaExtraAgent] Agent configured to the campaign.
      attr_reader :agent
      # @return [String] Agent's unique identifier.
      attr_reader :agent_id
      # @return [Pinnacle::Types::ExtendedBrand] Brand associated with this campaign.
      attr_reader :brand
      # @return [String] Link to document verifying the brand's name. This may be the certificate of
      #  incorporation, business license, or other relevant document. You can typically
      #  find this on the Secretary of State website.
      attr_reader :brand_verification_url
      # @return [Boolean] Indicates whether the brand has provided an attestation.
      attr_reader :brand_attestation
      # @return [String] Unique identifier for the campaign. This identifier is a string that always
      #  begins with the prefix `rcs_`, for example: `rcs_1234567890`.
      attr_reader :campaign_id
      # @return [Array<String>] List of what the agent might say to users.
      attr_reader :expected_agent_responses
      # @return [Pinnacle::Types::RcsCampaignSchemaExtraLinks] Legal documentation links.
      attr_reader :links
      # @return [Pinnacle::Types::ProfileStatusEnum]
      attr_reader :status
      # @return [Pinnacle::Types::RcsCampaignSchemaExtraOptIn] Opt-in configuration.
      attr_reader :opt_in
      # @return [Pinnacle::Types::RcsCampaignSchemaExtraOptOut] Opt-out configuration.
      attr_reader :opt_out
      # @return [Pinnacle::Types::RcsCampaignSchemaExtraUseCase] Use case classification for the campaign.
      attr_reader :use_case
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param agent [Pinnacle::Types::RcsCampaignSchemaExtraAgent] Agent configured to the campaign.
      # @param agent_id [String] Agent's unique identifier.
      # @param brand [Pinnacle::Types::ExtendedBrand] Brand associated with this campaign.
      # @param brand_verification_url [String] Link to document verifying the brand's name. This may be the certificate of
      #  incorporation, business license, or other relevant document. You can typically
      #  find this on the Secretary of State website.
      # @param brand_attestation [Boolean] Indicates whether the brand has provided an attestation.
      # @param campaign_id [String] Unique identifier for the campaign. This identifier is a string that always
      #  begins with the prefix `rcs_`, for example: `rcs_1234567890`.
      # @param expected_agent_responses [Array<String>] List of what the agent might say to users.
      # @param links [Pinnacle::Types::RcsCampaignSchemaExtraLinks] Legal documentation links.
      # @param status [Pinnacle::Types::ProfileStatusEnum]
      # @param opt_in [Pinnacle::Types::RcsCampaignSchemaExtraOptIn] Opt-in configuration.
      # @param opt_out [Pinnacle::Types::RcsCampaignSchemaExtraOptOut] Opt-out configuration.
      # @param use_case [Pinnacle::Types::RcsCampaignSchemaExtraUseCase] Use case classification for the campaign.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::ExtendedRcsCampaign]
      def initialize(agent:, agent_id:, brand:, brand_attestation:, status:, brand_verification_url: OMIT, campaign_id: OMIT,
                     expected_agent_responses: OMIT, links: OMIT, opt_in: OMIT, opt_out: OMIT, use_case: OMIT, additional_properties: nil)
        @agent = agent
        @agent_id = agent_id
        @brand = brand
        @brand_verification_url = brand_verification_url if brand_verification_url != OMIT
        @brand_attestation = brand_attestation
        @campaign_id = campaign_id if campaign_id != OMIT
        @expected_agent_responses = expected_agent_responses if expected_agent_responses != OMIT
        @links = links if links != OMIT
        @status = status
        @opt_in = opt_in if opt_in != OMIT
        @opt_out = opt_out if opt_out != OMIT
        @use_case = use_case if use_case != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "agent": agent,
          "agentId": agent_id,
          "brand": brand,
          "brandVerificationUrl": brand_verification_url,
          "brandAttestation": brand_attestation,
          "campaignId": campaign_id,
          "expectedAgentResponses": expected_agent_responses,
          "links": links,
          "status": status,
          "optIn": opt_in,
          "optOut": opt_out,
          "useCase": use_case
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ExtendedRcsCampaign
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::ExtendedRcsCampaign]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["agent"].nil?
          agent = nil
        else
          agent = parsed_json["agent"].to_json
          agent = Pinnacle::Types::RcsCampaignSchemaExtraAgent.from_json(json_object: agent)
        end
        agent_id = parsed_json["agentId"]
        if parsed_json["brand"].nil?
          brand = nil
        else
          brand = parsed_json["brand"].to_json
          brand = Pinnacle::Types::ExtendedBrand.from_json(json_object: brand)
        end
        brand_verification_url = parsed_json["brandVerificationUrl"]
        brand_attestation = parsed_json["brandAttestation"]
        campaign_id = parsed_json["campaignId"]
        expected_agent_responses = parsed_json["expectedAgentResponses"]
        if parsed_json["links"].nil?
          links = nil
        else
          links = parsed_json["links"].to_json
          links = Pinnacle::Types::RcsCampaignSchemaExtraLinks.from_json(json_object: links)
        end
        status = parsed_json["status"]
        if parsed_json["optIn"].nil?
          opt_in = nil
        else
          opt_in = parsed_json["optIn"].to_json
          opt_in = Pinnacle::Types::RcsCampaignSchemaExtraOptIn.from_json(json_object: opt_in)
        end
        if parsed_json["optOut"].nil?
          opt_out = nil
        else
          opt_out = parsed_json["optOut"].to_json
          opt_out = Pinnacle::Types::RcsCampaignSchemaExtraOptOut.from_json(json_object: opt_out)
        end
        if parsed_json["useCase"].nil?
          use_case = nil
        else
          use_case = parsed_json["useCase"].to_json
          use_case = Pinnacle::Types::RcsCampaignSchemaExtraUseCase.from_json(json_object: use_case)
        end
        new(
          agent: agent,
          agent_id: agent_id,
          brand: brand,
          brand_verification_url: brand_verification_url,
          brand_attestation: brand_attestation,
          campaign_id: campaign_id,
          expected_agent_responses: expected_agent_responses,
          links: links,
          status: status,
          opt_in: opt_in,
          opt_out: opt_out,
          use_case: use_case,
          additional_properties: struct
        )
      end

      # Serialize an instance of ExtendedRcsCampaign to a JSON object
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
        Pinnacle::Types::RcsCampaignSchemaExtraAgent.validate_raw(obj: obj.agent)
        obj.agent_id.is_a?(String) != false || raise("Passed value for field obj.agent_id is not the expected type, validation failed.")
        Pinnacle::Types::ExtendedBrand.validate_raw(obj: obj.brand)
        obj.brand_verification_url&.is_a?(String) != false || raise("Passed value for field obj.brand_verification_url is not the expected type, validation failed.")
        obj.brand_attestation.is_a?(Boolean) != false || raise("Passed value for field obj.brand_attestation is not the expected type, validation failed.")
        obj.campaign_id&.is_a?(String) != false || raise("Passed value for field obj.campaign_id is not the expected type, validation failed.")
        obj.expected_agent_responses&.is_a?(Array) != false || raise("Passed value for field obj.expected_agent_responses is not the expected type, validation failed.")
        obj.links.nil? || Pinnacle::Types::RcsCampaignSchemaExtraLinks.validate_raw(obj: obj.links)
        obj.status.is_a?(Pinnacle::Types::ProfileStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.opt_in.nil? || Pinnacle::Types::RcsCampaignSchemaExtraOptIn.validate_raw(obj: obj.opt_in)
        obj.opt_out.nil? || Pinnacle::Types::RcsCampaignSchemaExtraOptOut.validate_raw(obj: obj.opt_out)
        obj.use_case.nil? || Pinnacle::Types::RcsCampaignSchemaExtraUseCase.validate_raw(obj: obj.use_case)
      end
    end
  end
end
