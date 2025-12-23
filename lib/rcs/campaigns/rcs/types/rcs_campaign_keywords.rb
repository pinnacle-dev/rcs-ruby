# frozen_string_literal: true

require_relative "rcs_campaign_help_keywords"
require_relative "rcs_campaign_opt_in_keywords"
require_relative "rcs_campaign_opt_out_keywords"
require "ostruct"
require "json"

module Pinnacle
  module Campaigns
    module Rcs
      module Types
        class RcsCampaignKeywords
          # @return [Pinnacle::Campaigns::Rcs::Types::RcsCampaignHelpKeywords]
          attr_reader :help
          # @return [Pinnacle::Campaigns::Rcs::Types::RcsCampaignOptInKeywords]
          attr_reader :opt_in
          # @return [Pinnacle::Campaigns::Rcs::Types::RcsCampaignOptOutKeywords]
          attr_reader :opt_out
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param help [Pinnacle::Campaigns::Rcs::Types::RcsCampaignHelpKeywords]
          # @param opt_in [Pinnacle::Campaigns::Rcs::Types::RcsCampaignOptInKeywords]
          # @param opt_out [Pinnacle::Campaigns::Rcs::Types::RcsCampaignOptOutKeywords]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [Pinnacle::Campaigns::Rcs::Types::RcsCampaignKeywords]
          def initialize(help: OMIT, opt_in: OMIT, opt_out: OMIT, additional_properties: nil)
            @help = help if help != OMIT
            @opt_in = opt_in if opt_in != OMIT
            @opt_out = opt_out if opt_out != OMIT
            @additional_properties = additional_properties
            @_field_set = { "HELP": help, "OPT_IN": opt_in, "OPT_OUT": opt_out }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of RcsCampaignKeywords
          #
          # @param json_object [String]
          # @return [Pinnacle::Campaigns::Rcs::Types::RcsCampaignKeywords]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["HELP"].nil?
              help = nil
            else
              help = parsed_json["HELP"].to_json
              help = Pinnacle::Campaigns::Rcs::Types::RcsCampaignHelpKeywords.from_json(json_object: help)
            end
            if parsed_json["OPT_IN"].nil?
              opt_in = nil
            else
              opt_in = parsed_json["OPT_IN"].to_json
              opt_in = Pinnacle::Campaigns::Rcs::Types::RcsCampaignOptInKeywords.from_json(json_object: opt_in)
            end
            if parsed_json["OPT_OUT"].nil?
              opt_out = nil
            else
              opt_out = parsed_json["OPT_OUT"].to_json
              opt_out = Pinnacle::Campaigns::Rcs::Types::RcsCampaignOptOutKeywords.from_json(json_object: opt_out)
            end
            new(
              help: help,
              opt_in: opt_in,
              opt_out: opt_out,
              additional_properties: struct
            )
          end

          # Serialize an instance of RcsCampaignKeywords to a JSON object
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
            obj.help.nil? || Pinnacle::Campaigns::Rcs::Types::RcsCampaignHelpKeywords.validate_raw(obj: obj.help)
            obj.opt_in.nil? || Pinnacle::Campaigns::Rcs::Types::RcsCampaignOptInKeywords.validate_raw(obj: obj.opt_in)
            obj.opt_out.nil? || Pinnacle::Campaigns::Rcs::Types::RcsCampaignOptOutKeywords.validate_raw(obj: obj.opt_out)
          end
        end
      end
    end
  end
end
