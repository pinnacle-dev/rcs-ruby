# frozen_string_literal: true

require_relative "toll_free_campaign_help_keywords"
require_relative "toll_free_campaign_opt_in_keywords"
require "ostruct"
require "json"

module Pinnacle
  module Campaigns
    module TollFree
      module Types
        # Keyword response configuration.
        class TollFreeCampaignKeywords
          # @return [Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignHelpKeywords] Help keyword settings.
          attr_reader :help
          # @return [Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignOptInKeywords] Opt-in keyword settings.
          attr_reader :opt_in
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param help [Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignHelpKeywords] Help keyword settings.
          # @param opt_in [Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignOptInKeywords] Opt-in keyword settings.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignKeywords]
          def initialize(help: OMIT, opt_in: OMIT, additional_properties: nil)
            @help = help if help != OMIT
            @opt_in = opt_in if opt_in != OMIT
            @additional_properties = additional_properties
            @_field_set = { "HELP": help, "OPT_IN": opt_in }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of TollFreeCampaignKeywords
          #
          # @param json_object [String]
          # @return [Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignKeywords]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["HELP"].nil?
              help = nil
            else
              help = parsed_json["HELP"].to_json
              help = Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignHelpKeywords.from_json(json_object: help)
            end
            if parsed_json["OPT_IN"].nil?
              opt_in = nil
            else
              opt_in = parsed_json["OPT_IN"].to_json
              opt_in = Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignOptInKeywords.from_json(json_object: opt_in)
            end
            new(
              help: help,
              opt_in: opt_in,
              additional_properties: struct
            )
          end

          # Serialize an instance of TollFreeCampaignKeywords to a JSON object
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
            obj.help.nil? || Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignHelpKeywords.validate_raw(obj: obj.help)
            obj.opt_in.nil? || Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignOptInKeywords.validate_raw(obj: obj.opt_in)
          end
        end
      end
    end
  end
end
