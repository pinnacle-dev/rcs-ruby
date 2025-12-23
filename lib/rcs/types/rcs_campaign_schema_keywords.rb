# frozen_string_literal: true

require_relative "rcs_campaign_schema_keywords_help"
require_relative "rcs_campaign_schema_keywords_opt_in"
require_relative "rcs_campaign_schema_keywords_opt_out"
require "ostruct"
require "json"

module Pinnacle
  module Types
    class RcsCampaignSchemaKeywords
      # @return [Pinnacle::Types::RcsCampaignSchemaKeywordsHelp]
      attr_reader :help
      # @return [Pinnacle::Types::RcsCampaignSchemaKeywordsOptIn]
      attr_reader :opt_in
      # @return [Pinnacle::Types::RcsCampaignSchemaKeywordsOptOut]
      attr_reader :opt_out
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param help [Pinnacle::Types::RcsCampaignSchemaKeywordsHelp]
      # @param opt_in [Pinnacle::Types::RcsCampaignSchemaKeywordsOptIn]
      # @param opt_out [Pinnacle::Types::RcsCampaignSchemaKeywordsOptOut]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::RcsCampaignSchemaKeywords]
      def initialize(help: OMIT, opt_in: OMIT, opt_out: OMIT, additional_properties: nil)
        @help = help if help != OMIT
        @opt_in = opt_in if opt_in != OMIT
        @opt_out = opt_out if opt_out != OMIT
        @additional_properties = additional_properties
        @_field_set = { "HELP": help, "OPT_IN": opt_in, "OPT_OUT": opt_out }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RcsCampaignSchemaKeywords
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::RcsCampaignSchemaKeywords]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["HELP"].nil?
          help = nil
        else
          help = parsed_json["HELP"].to_json
          help = Pinnacle::Types::RcsCampaignSchemaKeywordsHelp.from_json(json_object: help)
        end
        if parsed_json["OPT_IN"].nil?
          opt_in = nil
        else
          opt_in = parsed_json["OPT_IN"].to_json
          opt_in = Pinnacle::Types::RcsCampaignSchemaKeywordsOptIn.from_json(json_object: opt_in)
        end
        if parsed_json["OPT_OUT"].nil?
          opt_out = nil
        else
          opt_out = parsed_json["OPT_OUT"].to_json
          opt_out = Pinnacle::Types::RcsCampaignSchemaKeywordsOptOut.from_json(json_object: opt_out)
        end
        new(
          help: help,
          opt_in: opt_in,
          opt_out: opt_out,
          additional_properties: struct
        )
      end

      # Serialize an instance of RcsCampaignSchemaKeywords to a JSON object
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
        obj.help.nil? || Pinnacle::Types::RcsCampaignSchemaKeywordsHelp.validate_raw(obj: obj.help)
        obj.opt_in.nil? || Pinnacle::Types::RcsCampaignSchemaKeywordsOptIn.validate_raw(obj: obj.opt_in)
        obj.opt_out.nil? || Pinnacle::Types::RcsCampaignSchemaKeywordsOptOut.validate_raw(obj: obj.opt_out)
      end
    end
  end
end
