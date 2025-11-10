# frozen_string_literal: true

require_relative "campaign_enum"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Information about the campaign associated with a conversation
    class CampaignQuery
      # @return [String] Unique identifier for the campaign. This identifier is a string that begins with
      #  the prefix:
      #  - TOLL_FREE: `tf_` (e.g., `tf_1234567890`)
      #  - 10DLC: `dlc_` (e.g., `dlc_1234567890`)
      #  - RCS: `rcs_` (e.g., `rcs_1234567890`)
      attr_reader :id
      # @return [Pinnacle::Types::CampaignEnum]
      attr_reader :type
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String] Unique identifier for the campaign. This identifier is a string that begins with
      #  the prefix:
      #  - TOLL_FREE: `tf_` (e.g., `tf_1234567890`)
      #  - 10DLC: `dlc_` (e.g., `dlc_1234567890`)
      #  - RCS: `rcs_` (e.g., `rcs_1234567890`)
      # @param type [Pinnacle::Types::CampaignEnum]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::CampaignQuery]
      def initialize(id:, type:, additional_properties: nil)
        @id = id
        @type = type
        @additional_properties = additional_properties
        @_field_set = { "id": id, "type": type }
      end

      # Deserialize a JSON object to an instance of CampaignQuery
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::CampaignQuery]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        type = parsed_json["type"]
        new(
          id: id,
          type: type,
          additional_properties: struct
        )
      end

      # Serialize an instance of CampaignQuery to a JSON object
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
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.type.is_a?(Pinnacle::Types::CampaignEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      end
    end
  end
end
