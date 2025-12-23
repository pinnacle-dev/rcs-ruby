# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Campaigns
    module TollFree
      module Types
        # Opt-in keyword settings.
        class TollFreeCampaignOptInKeywords
          # @return [String] Message sent when a user opt-in. Must include brand name, confirmation of
          #  subscription, and disclosures (STOP and HELP instructions, message and data
          #  rates).
          attr_reader :message
          # @return [Array<String>] Keywords that trigger opt-in response.
          attr_reader :keywords
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param message [String] Message sent when a user opt-in. Must include brand name, confirmation of
          #  subscription, and disclosures (STOP and HELP instructions, message and data
          #  rates).
          # @param keywords [Array<String>] Keywords that trigger opt-in response.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignOptInKeywords]
          def initialize(message: OMIT, keywords: OMIT, additional_properties: nil)
            @message = message if message != OMIT
            @keywords = keywords if keywords != OMIT
            @additional_properties = additional_properties
            @_field_set = { "message": message, "keywords": keywords }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of TollFreeCampaignOptInKeywords
          #
          # @param json_object [String]
          # @return [Pinnacle::Campaigns::TollFree::Types::TollFreeCampaignOptInKeywords]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            message = parsed_json["message"]
            keywords = parsed_json["keywords"]
            new(
              message: message,
              keywords: keywords,
              additional_properties: struct
            )
          end

          # Serialize an instance of TollFreeCampaignOptInKeywords to a JSON object
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
            obj.message&.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
            obj.keywords&.is_a?(Array) != false || raise("Passed value for field obj.keywords is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
