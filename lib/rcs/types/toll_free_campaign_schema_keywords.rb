# frozen_string_literal: true

require_relative "toll_free_campaign_schema_keywords_help"
require_relative "toll_free_campaign_schema_keywords_opt_in"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Keyword response configuration.
    class TollFreeCampaignSchemaKeywords
      # @return [Pinnacle::Types::TollFreeCampaignSchemaKeywordsHelp] Help keyword settings.
      attr_reader :help
      # @return [Pinnacle::Types::TollFreeCampaignSchemaKeywordsOptIn] Opt-in keyword settings.
      attr_reader :opt_in
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param help [Pinnacle::Types::TollFreeCampaignSchemaKeywordsHelp] Help keyword settings.
      # @param opt_in [Pinnacle::Types::TollFreeCampaignSchemaKeywordsOptIn] Opt-in keyword settings.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::TollFreeCampaignSchemaKeywords]
      def initialize(help: OMIT, opt_in: OMIT, additional_properties: nil)
        @help = help if help != OMIT
        @opt_in = opt_in if opt_in != OMIT
        @additional_properties = additional_properties
        @_field_set = { "HELP": help, "OPT_IN": opt_in }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of TollFreeCampaignSchemaKeywords
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::TollFreeCampaignSchemaKeywords]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["HELP"].nil?
          help = nil
        else
          help = parsed_json["HELP"].to_json
          help = Pinnacle::Types::TollFreeCampaignSchemaKeywordsHelp.from_json(json_object: help)
        end
        if parsed_json["OPT_IN"].nil?
          opt_in = nil
        else
          opt_in = parsed_json["OPT_IN"].to_json
          opt_in = Pinnacle::Types::TollFreeCampaignSchemaKeywordsOptIn.from_json(json_object: opt_in)
        end
        new(
          help: help,
          opt_in: opt_in,
          additional_properties: struct
        )
      end

      # Serialize an instance of TollFreeCampaignSchemaKeywords to a JSON object
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
        obj.help.nil? || Pinnacle::Types::TollFreeCampaignSchemaKeywordsHelp.validate_raw(obj: obj.help)
        obj.opt_in.nil? || Pinnacle::Types::TollFreeCampaignSchemaKeywordsOptIn.validate_raw(obj: obj.opt_in)
      end
    end
  end
end
