# frozen_string_literal: true

require_relative "rcs_campaign_schema_agent_emails_item"
require_relative "rcs_campaign_schema_agent_phones_item"
require_relative "rcs_campaign_schema_agent_websites_item"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Agent configured to the campaign.
    class RcsCampaignSchemaAgent
      # @return [String] Name of the agent.
      attr_reader :name
      # @return [String] Description of the agent.
      attr_reader :description
      # @return [String] Color of the agent's buttons.
      attr_reader :color
      # @return [Array<Pinnacle::Types::RcsCampaignSchemaAgentEmailsItem>] List of emails.
      attr_reader :emails
      # @return [Array<Pinnacle::Types::RcsCampaignSchemaAgentPhonesItem>] List of phone numbers.
      attr_reader :phones
      # @return [Array<Pinnacle::Types::RcsCampaignSchemaAgentWebsitesItem>] List of urls.
      attr_reader :websites
      # @return [String] Link to the agent's hero. Hero must be an image file with dimensions 1440x448px.
      attr_reader :hero_url
      # @return [String] Link to the agent's icon. Icon must be an image file with dimensions 224x224px.
      attr_reader :icon_url
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param name [String] Name of the agent.
      # @param description [String] Description of the agent.
      # @param color [String] Color of the agent's buttons.
      # @param emails [Array<Pinnacle::Types::RcsCampaignSchemaAgentEmailsItem>] List of emails.
      # @param phones [Array<Pinnacle::Types::RcsCampaignSchemaAgentPhonesItem>] List of phone numbers.
      # @param websites [Array<Pinnacle::Types::RcsCampaignSchemaAgentWebsitesItem>] List of urls.
      # @param hero_url [String] Link to the agent's hero. Hero must be an image file with dimensions 1440x448px.
      # @param icon_url [String] Link to the agent's icon. Icon must be an image file with dimensions 224x224px.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RcsCampaignSchemaAgent]
      def initialize(name: OMIT, description: OMIT, color: OMIT, emails: OMIT, phones: OMIT, websites: OMIT,
                     hero_url: OMIT, icon_url: OMIT, additional_properties: nil)
        @name = name if name != OMIT
        @description = description if description != OMIT
        @color = color if color != OMIT
        @emails = emails if emails != OMIT
        @phones = phones if phones != OMIT
        @websites = websites if websites != OMIT
        @hero_url = hero_url if hero_url != OMIT
        @icon_url = icon_url if icon_url != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "name": name,
          "description": description,
          "color": color,
          "emails": emails,
          "phones": phones,
          "websites": websites,
          "heroUrl": hero_url,
          "iconUrl": icon_url
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RcsCampaignSchemaAgent
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RcsCampaignSchemaAgent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = parsed_json["name"]
        description = parsed_json["description"]
        color = parsed_json["color"]
        emails = parsed_json["emails"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::RcsCampaignSchemaAgentEmailsItem.from_json(json_object: item)
        end
        phones = parsed_json["phones"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::RcsCampaignSchemaAgentPhonesItem.from_json(json_object: item)
        end
        websites = parsed_json["websites"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::RcsCampaignSchemaAgentWebsitesItem.from_json(json_object: item)
        end
        hero_url = parsed_json["heroUrl"]
        icon_url = parsed_json["iconUrl"]
        new(
          name: name,
          description: description,
          color: color,
          emails: emails,
          phones: phones,
          websites: websites,
          hero_url: hero_url,
          icon_url: icon_url,
          additional_properties: struct
        )
      end

      # Serialize an instance of RcsCampaignSchemaAgent to a JSON object
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
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.color&.is_a?(String) != false || raise("Passed value for field obj.color is not the expected type, validation failed.")
        obj.emails&.is_a?(Array) != false || raise("Passed value for field obj.emails is not the expected type, validation failed.")
        obj.phones&.is_a?(Array) != false || raise("Passed value for field obj.phones is not the expected type, validation failed.")
        obj.websites&.is_a?(Array) != false || raise("Passed value for field obj.websites is not the expected type, validation failed.")
        obj.hero_url&.is_a?(String) != false || raise("Passed value for field obj.hero_url is not the expected type, validation failed.")
        obj.icon_url&.is_a?(String) != false || raise("Passed value for field obj.icon_url is not the expected type, validation failed.")
      end
    end
  end
end
