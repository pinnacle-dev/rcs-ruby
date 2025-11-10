# frozen_string_literal: true

require_relative "get_toll_free_campaign_status_response_updates"
require "ostruct"
require "json"

module Pinnacle
  module Types
    # Response for get toll-free campaign status.
    class TollFreeCampaignStatus
      # @return [String] Summary of errors related to the verification process. <br>
      #  These errors may request additional information or point out erroneous and/or
      #  missing fields.
      attr_reader :error
      # @return [String] The unique identifier of the toll-free campaign. This identifier is a string
      #  that always begins with the prefix `tf_`, for example: `tf_1234567890`.
      attr_reader :id
      # @return [Pinnacle::Types::GetTollFreeCampaignStatusResponseUpdates] Status of phone numbers that are being attached to this campaign. <br>
      #  Note that phone numbers can only be attached to `VERIFIED` campaigns via the
      #  [attach campaign endpoint](../phone-numbers/attach-campaign).
      attr_reader :updates
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param error [String] Summary of errors related to the verification process. <br>
      #  These errors may request additional information or point out erroneous and/or
      #  missing fields.
      # @param id [String] The unique identifier of the toll-free campaign. This identifier is a string
      #  that always begins with the prefix `tf_`, for example: `tf_1234567890`.
      # @param updates [Pinnacle::Types::GetTollFreeCampaignStatusResponseUpdates] Status of phone numbers that are being attached to this campaign. <br>
      #  Note that phone numbers can only be attached to `VERIFIED` campaigns via the
      #  [attach campaign endpoint](../phone-numbers/attach-campaign).
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Pinnacle::Types::TollFreeCampaignStatus]
      def initialize(id:, updates:, error: OMIT, additional_properties: nil)
        @error = error if error != OMIT
        @id = id
        @updates = updates
        @additional_properties = additional_properties
        @_field_set = { "error": error, "id": id, "updates": updates }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of TollFreeCampaignStatus
      #
      # @param json_object [String]
      # @return [Pinnacle::Types::TollFreeCampaignStatus]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        error = parsed_json["error"]
        id = parsed_json["id"]
        if parsed_json["updates"].nil?
          updates = nil
        else
          updates = parsed_json["updates"].to_json
          updates = Pinnacle::Types::GetTollFreeCampaignStatusResponseUpdates.from_json(json_object: updates)
        end
        new(
          error: error,
          id: id,
          updates: updates,
          additional_properties: struct
        )
      end

      # Serialize an instance of TollFreeCampaignStatus to a JSON object
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
        obj.error&.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        Pinnacle::Types::GetTollFreeCampaignStatusResponseUpdates.validate_raw(obj: obj.updates)
      end
    end
  end
end
