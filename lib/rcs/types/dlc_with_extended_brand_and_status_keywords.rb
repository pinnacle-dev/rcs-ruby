# frozen_string_literal: true

require_relative "dlc_with_extended_brand_and_status_keywords_help"
require_relative "dlc_with_extended_brand_and_status_keywords_opt_in"
require_relative "dlc_with_extended_brand_and_status_keywords_opt_out"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Keyword response configuration.
    class DlcWithExtendedBrandAndStatusKeywords
      # @return [Pinnacle::Types::DlcWithExtendedBrandAndStatusKeywordsHelp] Help keyword settings.
      attr_reader :help
      # @return [Pinnacle::Types::DlcWithExtendedBrandAndStatusKeywordsOptIn] Opt-in keyword settings.
      attr_reader :opt_in
      # @return [Pinnacle::Types::DlcWithExtendedBrandAndStatusKeywordsOptOut] Opt-out keyword settings.
      attr_reader :opt_out
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param help [Pinnacle::Types::DlcWithExtendedBrandAndStatusKeywordsHelp] Help keyword settings.
      # @param opt_in [Pinnacle::Types::DlcWithExtendedBrandAndStatusKeywordsOptIn] Opt-in keyword settings.
      # @param opt_out [Pinnacle::Types::DlcWithExtendedBrandAndStatusKeywordsOptOut] Opt-out keyword settings.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::DlcWithExtendedBrandAndStatusKeywords]
      def initialize(help:, opt_in:, opt_out:, additional_properties: nil)
        @help = help
        @opt_in = opt_in
        @opt_out = opt_out
        @additional_properties = additional_properties
        @_field_set = { "HELP": help, "OPT_IN": opt_in, "OPT_OUT": opt_out }
      end

      # Deserialize a JSON object to an instance of
      #  DlcWithExtendedBrandAndStatusKeywords
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::DlcWithExtendedBrandAndStatusKeywords]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["HELP"].nil?
          help = nil
        else
          help = parsed_json["HELP"].to_json
          help = Pinnacle::Types::DlcWithExtendedBrandAndStatusKeywordsHelp.from_json(json_object: help)
        end
        if parsed_json["OPT_IN"].nil?
          opt_in = nil
        else
          opt_in = parsed_json["OPT_IN"].to_json
          opt_in = Pinnacle::Types::DlcWithExtendedBrandAndStatusKeywordsOptIn.from_json(json_object: opt_in)
        end
        if parsed_json["OPT_OUT"].nil?
          opt_out = nil
        else
          opt_out = parsed_json["OPT_OUT"].to_json
          opt_out = Pinnacle::Types::DlcWithExtendedBrandAndStatusKeywordsOptOut.from_json(json_object: opt_out)
        end
        new(
          help: help,
          opt_in: opt_in,
          opt_out: opt_out,
          additional_properties: struct
        )
      end

      # Serialize an instance of DlcWithExtendedBrandAndStatusKeywords to a JSON object
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
        Pinnacle::Types::DlcWithExtendedBrandAndStatusKeywordsHelp.validate_raw(obj: obj.help)
        Pinnacle::Types::DlcWithExtendedBrandAndStatusKeywordsOptIn.validate_raw(obj: obj.opt_in)
        Pinnacle::Types::DlcWithExtendedBrandAndStatusKeywordsOptOut.validate_raw(obj: obj.opt_out)
      end
    end
  end
end
