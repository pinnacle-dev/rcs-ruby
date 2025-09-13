# frozen_string_literal: true

require "ostruct"
require "json"

module Pinnacle
  module Campaigns
    module Dlc
      module Types
        # Help keyword settings.
        class UpsertDlcCampaignHelpKeywords
          # @return [String] Response message for help keywords.
          attr_reader :message
          # @return [Array<String>] Keywords that trigger help response.
          attr_reader :values
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param message [String] Response message for help keywords.
          # @param values [Array<String>] Keywords that trigger help response.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [Pinnacle::Campaigns::Dlc::Types::UpsertDlcCampaignHelpKeywords]
          def initialize(message: OMIT, values: OMIT, additional_properties: nil)
            @message = message if message != OMIT
            @values = values if values != OMIT
            @additional_properties = additional_properties
            @_field_set = { "message": message, "values": values }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of UpsertDlcCampaignHelpKeywords
          #
          # @param json_object [String]
          # @return [Pinnacle::Campaigns::Dlc::Types::UpsertDlcCampaignHelpKeywords]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            message = parsed_json["message"]
            values = parsed_json["values"]
            new(
              message: message,
              values: values,
              additional_properties: struct
            )
          end

          # Serialize an instance of UpsertDlcCampaignHelpKeywords to a JSON object
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
            obj.values&.is_a?(Array) != false || raise("Passed value for field obj.values is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
