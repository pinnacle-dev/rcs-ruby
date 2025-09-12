# frozen_string_literal: true

require_relative "rcs_campaign_schema_extra_agent_emails_item"
require_relative "rcs_campaign_schema_extra_agent_phones_item"
require_relative "rcs_campaign_schema_extra_agent_websites_item"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Agent configured to the campaign.
    class RcsCampaignSchemaExtraAgent
      # @return [String] Color of the agent's buttons.
      attr_reader :color
      # @return [String] Description of the agent.
      attr_reader :description
      # @return [Array<Pinnacle::Types::RcsCampaignSchemaExtraAgentEmailsItem>] List of emails.
      attr_reader :emails
      # @return [String] Link to the agent's hero.
      attr_reader :hero_url
      # @return [String] Link to the agent's icon.
      attr_reader :icon_url
      # @return [String] Name of the agent.
      attr_reader :name
      # @return [Array<Pinnacle::Types::RcsCampaignSchemaExtraAgentPhonesItem>] List of phone numbers.
      attr_reader :phones
      # @return [Array<Pinnacle::Types::RcsCampaignSchemaExtraAgentWebsitesItem>] List of urls.
      attr_reader :websites
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param color [String] Color of the agent's buttons.
      # @param description [String] Description of the agent.
      # @param emails [Array<Pinnacle::Types::RcsCampaignSchemaExtraAgentEmailsItem>] List of emails.
      # @param hero_url [String] Link to the agent's hero.
      # @param icon_url [String] Link to the agent's icon.
      # @param name [String] Name of the agent.
      # @param phones [Array<Pinnacle::Types::RcsCampaignSchemaExtraAgentPhonesItem>] List of phone numbers.
      # @param websites [Array<Pinnacle::Types::RcsCampaignSchemaExtraAgentWebsitesItem>] List of urls.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RcsCampaignSchemaExtraAgent]
      def initialize(color: OMIT, description: OMIT, emails: OMIT, hero_url: OMIT, icon_url: OMIT, name: OMIT,
                     phones: OMIT, websites: OMIT, additional_properties: nil)
        @color = color if color != OMIT
        @description = description if description != OMIT
        @emails = emails if emails != OMIT
        @hero_url = hero_url if hero_url != OMIT
        @icon_url = icon_url if icon_url != OMIT
        @name = name if name != OMIT
        @phones = phones if phones != OMIT
        @websites = websites if websites != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "color": color,
          "description": description,
          "emails": emails,
          "heroUrl": hero_url,
          "iconUrl": icon_url,
          "name": name,
          "phones": phones,
          "websites": websites
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RcsCampaignSchemaExtraAgent
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RcsCampaignSchemaExtraAgent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        color = parsed_json["color"]
        description = parsed_json["description"]
        emails = parsed_json["emails"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::RcsCampaignSchemaExtraAgentEmailsItem.from_json(json_object: item)
        end
        hero_url = parsed_json["heroUrl"]
        icon_url = parsed_json["iconUrl"]
        name = parsed_json["name"]
        phones = parsed_json["phones"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::RcsCampaignSchemaExtraAgentPhonesItem.from_json(json_object: item)
        end
        websites = parsed_json["websites"]&.map do |item|
          item = item.to_json
          Pinnacle::Types::RcsCampaignSchemaExtraAgentWebsitesItem.from_json(json_object: item)
        end
        new(
          color: color,
          description: description,
          emails: emails,
          hero_url: hero_url,
          icon_url: icon_url,
          name: name,
          phones: phones,
          websites: websites,
          additional_properties: struct
        )
      end

      # Serialize an instance of RcsCampaignSchemaExtraAgent to a JSON object
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
        obj.color&.is_a?(String) != false || raise("Passed value for field obj.color is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.emails&.is_a?(Array) != false || raise("Passed value for field obj.emails is not the expected type, validation failed.")
        obj.hero_url&.is_a?(String) != false || raise("Passed value for field obj.hero_url is not the expected type, validation failed.")
        obj.icon_url&.is_a?(String) != false || raise("Passed value for field obj.icon_url is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.phones&.is_a?(Array) != false || raise("Passed value for field obj.phones is not the expected type, validation failed.")
        obj.websites&.is_a?(Array) != false || raise("Passed value for field obj.websites is not the expected type, validation failed.")
      end
    end
  end
end
